`Caffeinate` keeps your computer awake during a long computation by calling `caffeinate` via an external shell evaluation.

```
longComputation[t_] := (Pause[t]; {1, 2, 3})

Caffeinate[longComputation[10]]

(* Out: {1, 2, 3} *)
```
The above calls `caffeinate` in the system's shell, evaluates `longComputation[10]` (which takes about `10` seconds to complete and returns `{1, 2, 3}`), then kills the process.

If the computation is terminated by an abort, e.g. by pressing <kbd>command</kbd><kbd>.</kbd>, the `caffeinate` process is still killed due to the use of `WithCleanup` internally, which protects parts of the computation against aborts. For example,
```
Caffeinate[longComputation[10]]
```
```
$Aborted (* caffeinate process killed nonetheless *)
```
------
A maximum time can be specified by either the option `MaxTime` or, if providing a time specification explicitly, via `Caffeinate[t][comp]` or `comp // Caffeinate[t]` syntax.
```
Caffeinate[longComputation[10], MaxTime -> 60] (* Calls `caffeinate -t 60` and caffeinates for at most 60 seconds; kills the caffeinate process if still running once `longComputation[10]` finishes *)
```
```
longComputation[10] // Caffeinate[5] (* Equivalent to the prior expression *)
```
```
longComputation[60] // Caffeinate[{2, 30}] (* Caffeinates for at most 2 minutes and 30 seconds *)
```
```
longComputation[60] // Caffeinate[{3, 30, 0}] (* Caffeinates for at most 3 hours and 30 minutes *)
```
```
longComputation[60] // Caffeinate[Quantity[1, "Hours"]] (* Caffeinates for at most 1 hour *)
```
-----
If something unusual happens, you can call `Decaffeinate[]` to kill all `caffeinate` processes via shell's `killall`:
```
Do[ExternalEvaluate["Shell", "caffeinate"], {3}]

Decaffeinate[] (* Prints each kill operation performed *)

Decaffeinate[] (* Prints that there are no caffeinate processes running *)
```
If you need to decaffeinate without printing information for some reason, use `DecaffeinateQuietly[]`.
