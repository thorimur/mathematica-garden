# Welcome!

...Oh, hello there! I was just pruning these definitions back. Welcome to my Mathematica garden.

Here, I grow a little collection of notebooks and packages. You're welcome to poke around; let me walk you through the layout.

Keep in mind this is a work-in-progress—I'm slowly transplanting my old projects here one-by-one, after years of growing them inside. There's a lot more to come!

## Layout

Each notebook or package is located in its own folder at the top level.

For **notebooks**, that folder contains the notebook file itself, plus a pdf of the notebook. This lets you preview the notebook and see any graphics in it without first downloading it and opening it yourself.

Folders for **packages** usually have the package itself plus a demonstration notebook and an associated pdf for viewing that notebook.

Package files (`*.wl` or `*.m`) are more amenable to being viewed in github directly, given that they're almost always just text.

Each folder also contains a `README.md` giving some context to the notebook or package—when is it from, what became of it, etc. Some packages and notebooks are WIPs, or from a while ago, or served a specific purpose. All that is in the `README`.

The `media` folder holds exported media from the notebook or package which I display in the `README`.

## Directory

### Notebooks

* [Gilbreath's conjecture](Gilbreath\'s%20conjecture) – a colorful visualization of [Gilbreath's conjecture](https://en.wikipedia.org/wiki/Gilbreath%27s_conjecture).
* [Reversible Bitfuck](Reversible%20Bitfuck) – visualization of the evaluation history of [reversible bitfuck](https://esolangs.org/wiki/Reversible_Bitfuck), an esolang derived from [Brainfuck](https://en.wikipedia.org/wiki/Brainfuck).
* [Robot arm](Robot%20arm) – a dynamically interactive jointed robotic arm, with explanations and visualizations for how the successive coordinate systems of each joint are constructed. (Midterm project from university.)

***Next up:***

* Qubits – a visualization of qubit states.

### Packages

* [Caffeinate](Caffeinate) – Wrap long computations in `Caffeinate` to keep your computer awake for their duration. (Likely only works on Unix systems with a standard shell.) And don't worry about leaving `caffeinate` processes running on your computer afterwards, either.

***Next up:***

* IMDb – Code to scrape the IMDb site for episode-length stats on TV shows. Proof of concept only, for personal use—do not use, or IMDb will be upset with you.
* TemplatePackage – A template package! Use it to grow new packages.
