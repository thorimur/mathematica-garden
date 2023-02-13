This is a notebook for visualizing the components of [Gilbreath's conjecture](https://en.wikipedia.org/wiki/Gilbreath%27s_conjecture).

Gilbreath's conjecture states that the following observed pattern is actually a rule:

*If you consider the sequence of prime numbers, and take the absolute difference between every consecutive term, and then the absolute difference between every consecutive term in the newly generated sequence, and so on, then each sequence thus generated will begin with a 1.*

It's easier (for me) to think about the statement visually, which is why I wrote this notebook. In the following image, the top row is the sequence of prime numbers, and each number is the absolute difference of the two numbers to the upper left and right of it.

![The image described above. Each number is a hexagon, and is colored according to its value, with red for two, black for zero, white for one, and other colors for higher numbers.](media/small-labeled-evolution.png)

Since we only start with a finite subsequence of the primes in this image, the right hand side ends rather unnaturally. But we can go further:

![A much wider version of the above. All hexagons are smaller, and the labels for the numbers are gone, because they would be too small to read.](media/large-unlabeled/evolution.png)

We stick to the same color scheme—everything that's black is zero, and everything that's red is two. 

Notice that once we have a row of all zeros or twos (started by a one), we know that the triangle generated underneath that row will satisfy Gilbreath's conjecture (i.e., the left side will be all 1's). This is because the set ${0,2}$ is closed under absolute difference, and the absolute difference of both $0$ and $2$ with $1$ is $1$. So, the bulk of the row stays of the same form (zeros and twos), and the 1 on the left edge propagates downward.

![A full triangle demonstrating this.](media/medium-triangle.png)
