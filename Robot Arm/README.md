This is a notebook from a midterm project for a robotics class I audited in university. The task was to simulate a robotic arm in a programming language of our choice.

![A gif of a cartoonish sequence of linked cylinders rotating at the places they join each other.](media/arm1.gif)

The interesting part here has to do with how we 1) parameterize the robot's configurations 2) construct the coordinate systems at each joint and translate between them.

For (1), we use the following variables.

* $\theta$ describes the degree the "joint plane" is rotated back from the perpendicular towards the incoming arm segment.

* $\phi$ describes the rotation around the incoming joint which we bend the rotation plane back along.

* $L_\theta$ describes the angle through which the robot arm is bent down vertically towards the joint plane.

* $q$ is a dynamic parameter describing the current rotation of the joint.

(In later code, we have a parameter $\psi$ which describes the azimuthal angle around the joint that the outgoing arm segment is bent down towards, but we ignore that here as it's nearly redundant with $q$.)

https://user-images.githubusercontent.com/68410468/223592563-572372f9-ff4b-44c6-9d6b-a446e66ecf81.mp4

Note that we can achieve an "elbow joint" by taking $L_\theta = \pi/2$ and $\theta = \pi/2$, and a "shoulder joint" by taking $L_\theta = \pi/2$ and $\theta = 0$.

https://user-images.githubusercontent.com/68410468/223592737-6cd2a0fa-4413-4e6a-8cfc-899b7dc50cbb.mp4

