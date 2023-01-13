(* ::Package:: *)

(* :Name: Caffeinate` *)

(* :Author: thorimur, 2023 *)

(* :Summary: This package calls `caffeinate` from within Mathematica to keep your computer awake during a long computation, then kills the process when the computation has finished. It's safe to hit abort during a long computation run inside Caffeinate, management of the external shell evaluation is protected against aborts via WithCleanup. This package is likely incompatible with Windows. *)

(* :Keyword: Caffeinate, ExternalEvaluate, Long computation. *)


(* ::Input::Initialization:: *)
BeginPackage["Caffeinate`"]


Unprotect @@ Names["Caffeinate`*"]

Remove @@ Names["Caffeinate`*"]


(* ::Input::Initialization:: *)
Caffeinate::usage = "Caffeinate[expr] calls caffeinate from your system's shell, then evaluates expr, then kills the caffeinate process when expr has either finished or an abort signal has been sent. The syntax expr // Caffeinate[t] caffeinates for a maximum time t by providing t as the value for the option MaxTime.";


Decaffeinate::usage="Decaffeinate[] kills all caffeinate processes. This should only need to be run in exceptional circumstances or for peace of mind; all caffeinate processes are stopped within the call to Caffeinate, even upon aborts."


DecaffeinateQuietly::usage="DecaffeinateQuietly[] kills all caffeinate processes and does not print any information while doing so."


MaxTime::usage="An option for Caffeinate specifying the maximum time to caffeinate. The value can be either Infinity, a nonnegative integer specifying the number of seconds to caffeinate, a Quantity expression for days, hours, minutes, or seconds, or else be in the form {m, s}, {h, m, s} where all list elements are nonnegative integers."


Caffeinate::time="`1` is not a valid time specification for Caffeinate."


(* ::Input::Initialization:: *)
Begin["`Private`"]


Options[Caffeinate]={MaxTime->Infinity}


SetAttributes[Caffeinate,HoldFirst]


(* ::Input::Initialization:: *)
TimeSpec[Infinity]="";
TimeSpec[0]=" -t -1";
TimeSpec[t_Integer?Positive]:=" -t "<>ToString[t]
TimeSpec[{m_Integer?NonNegative,s_Integer?NonNegative}]:=TimeSpec[60*m+s]
TimeSpec[{h_Integer?NonNegative,m_Integer?NonNegative,s_Integer?NonNegative}]:=TimeSpec[3600*h+60*m+s]
TimeSpec[q:Quantity[_,"Days"|"Hours"|"Minutes"|"Seconds"]]:=TimeSpec[QuantityMagnitude[q,"Seconds"]]
TimeSpec[x_]:=(Message[Caffeinate::time,x];$Failed)


Caffeinate[expr_, OptionsPattern[]] := 
  Enclose[Block[{sessionCaffeinate = Confirm[StartExternalSession["Shell"]]}, 
    Module[{pid, command = StringJoin["caffeinate", 
        Confirm[TimeSpec[OptionValue[MaxTime]]]]}, 
     WithCleanup[Block[{Print}, pid = Confirm[ExternalEvaluate[sessionCaffeinate, 
            StringJoin[command, " &\necho $!"]]]["StandardOutput"]]; , expr, 
      If[OptionValue[MaxTime] === Infinity || Block[{Print}, 
          Confirm[ExternalEvaluate[sessionCaffeinate, StringJoin["echo $(ps -o command= -p ", 
               pid,")"]]]["StandardOutput"] === command], 
        Confirm[ExternalEvaluate[sessionCaffeinate, StringJoin["kill ", pid]]]]; 
       Confirm[DeleteObject[sessionCaffeinate]]; ]]]]


Caffeinate[t:(Infinity|_Integer?NonNegative|{_Integer?NonNegative,_Integer?NonNegative}|{_Integer?NonNegative,_Integer?NonNegative,_Integer?NonNegative}|Quantity[_,"Days"|"Hours"|"Minutes"|"Seconds"])]:=Function[expr,Caffeinate[expr,MaxTime->t],HoldFirst]


Decaffeinate[]:=(Enclose@Confirm[ExternalEvaluate["Shell","killall -v caffeinate"]];)


DecaffeinateQuietly[]:=Block[{Print},Enclose@Confirm[ExternalEvaluate["Shell","killall caffeinate"]];]


(* ::Input::Initialization:: *)
End[]


Protect @@ Names["Caffeinate`*"]


(* ::Input::Initialization:: *)
EndPackage[]
