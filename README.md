# ODU WS-DL Thesis/Dissertation LaTeX Template

This is a ready to use ODU thesis/dissertation LaTeX template, both for Master and PhD, tailored to suit the needs of the [WS-DL Research Group](https://ws-dl.cs.odu.edu/).
The template is based on [the Old Dominion University Guide for the Preparation of These and Dissertation](https://www.odu.edu/content/dam/odu/offices/graduate-studies/thesis-dissertation/docs/thesis_dissertation_guide.pdf) *(last updated: November 2015)*.
This repository contains:

* a LaTeX class named, `wsdlthesis`
* a minimal bootstrap thesis with an opinionated directory structure and file naming convention
* a handful of useful macros
* a `Makefile` with common tasks and a `Dockerfile` to package necessary dependencies

## Getting Started

[Install necessary LaTeX](https://help.ubuntu.com/community/LaTeX) distribution or use [Docker](https://docs.docker.com/engine/installation/).
Then follow these steps:

```
$ git clone https://github.com/oduwsdl/wsdlthesis.git YOUR_THESIS_NAME
$ cd YOUR_THESIS_NAME
$ make
```

This should generate the `main.pdf` file in the working directory that has all the necessary skeleton of a PhD dissertation.

### Basic Customization

Change the basic properties such as `title` and `author` in the `config.tex` file to make it your own.
At the bottom of the `config.tex` file there are some configuration options that can be enabled/disabled as needed.

* `\mastertrue` - Uncomment this if a Master's thesis is desired (the default is PhD dissertation).
* `\proposaltrue` - Uncomment this for the candidacy proposal (the default is thesis/dissertation).
* `\revisiontrue` - Uncomment this to add the draft revision build date and time in the footer (the default is final formatting).

Alternatively, these attributes can be set by passing optional parameters to the `documentclass[master,proposal,revision]{wsdlthesis}` in the `main.tex` file.
Any additional parameters to the `wsdlthesis` class will be passed on to the parent `report` class.
We encourage to keep the `main.tex` file unchanged.

The `Abstract`, `Preface`, and `Vita` pages are placed under the `./pages` folder.
Modify corresponding `./pages/*.tex` files to make them your own.
Now, build again to make sure these changes are reflected in the `main.pdf` file.

```
$ make
```

### Adding Chapters

The repository is preloaded with `Introduction`, `Background`, and `Related Work` chapters under the `./chapters` folder.
We use a specific naming convention for chapter files like `01_introduction.tex` and `02_background.tex`.
Numeric prefix here makes it easy to include these files automatically in the desired order, while the chapter name helps to quickly open the desired file for modifications.
Start with modifying the content of the existing chapters and add more chapter files with the same naming convention as necessary.

A similar file naming convention is used for the appendix chapters that are located under the `./appendices` folder.
The example file there uses an alphabetical prefix in the file name to match the chapter numbering in the document, but any naming scheme would work as long as files are sortable in the desired order.

### Adding Bibliography

The `ref.bib` file is located in the root of the repository and referenced in the `main.tex` file.
In most cases, adding more entries in the bib file, as needed, would be sufficient.

### Adding Figures

A folder named `./figures` is specified as a place to store the figures.
Additionally, `\graphicspath` is set to this folder in the `config.tex` file so that figures can be added in the document just by using their names rather than a relative or absolute path.

### Adding Listings

Code samples are a very common thing that appear in a CS thesis.

***[TODO: We need to add a folder for external code samples, streamline the mechanism to add listings, include a list of listings after ToC in the class, and add some helper macros.]***

## Make Tasks

Task         | Description
-------------|-------------------------------------------------------------------
`make`       | Make a clean build of the `main.pdf`
`make build` | Repeatedly build LaTeX and BibTeX to ensure references are correct
`make clear` | Remove all intermediate files
`make clean` | Remove all intermediate files and the `main.pdf`
`make save`  | Save a timestamped copy of `main.pdf` under `./revisions` folder

## Using Docker

***[TODO: Add a Dockerfile and corresponding instructions.]***

## Macros

The repository comes with the `custommacros.sty` file that is included in the `main.tex` file.
This is a good place to include all the necessary packages needed for your thesis.
This files is preloaded with some helper macros, but add your own as necessary.

### `\todo`

The `\todo` macro adds a red **TODO** note.
This can be used with or without an argument.
`\todo` adds a default note while `\todo[Custom note]` allows the note customization.

### `\inputAllFiles`

The `\inputAllFiles` is a macro to add all `*.tex` files under the folder argument.
This is being used in the `main.tex` file to automatically include all the chapters and appendices.
This will only work on Unix-like machines, hence, Windows users should manually `\input` those files.
