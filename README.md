# bart

Print bar graphs in your shell.

**bart** takes a list of data and plots a chart with rectangular horizontal bars
with lengths proportional to the values represented.


## Installation

Clone this repository:

```shell
$ git clone git@github.com:arturoherrero/bart.git
```

Add `bart/bin/` to your `PATH`:

```shell
$ echo 'export PATH="${PATH}:path/to/bart/bin"' >> ~/.bash_profile
```

Source your profile:

```shell
$ source ~/.bash_profile
```

#### OS X

```shell
$ brew tap arturoherrero/formulae
$ brew install bart
```


## Usage

Just run `bart` and pass it a list of pair number of arguments (space-delimited),
the label and the value. It's designed to be used in conjunction with other
scripts that can output in that format.

    $ bart 2013 10 2014 60 2015 29 2016 0 2017 3
    2013: ██████████ 10
    2014: ████████████████████████████████████████████████████████████ 60
    2015: █████████████████████████████ 29
    2016: | 0
    2017: ███ 3

    $ echo Gin 30 Vermouth 20 Lemon 20 Syrup 10 | bart
    Gin:      ██████████████████████████████ 30
    Vermouth: ████████████████████ 20
    Lemon:    ████████████████████ 20
    Syrup:    ██████████ 10

BTW, you can learn more about [Cocktails for Programmers][2].


## Who made this?

This was made by Arturo Herrero under the MIT License. Find me on Twitter
[@ArturoHerrero][3].


[1]: https://github.com/arturoherrero/bart/blob/master/bart
[2]: https://github.com/the-teacher/cocktails_for_programmers/blob/master/cocktails_for_programers.md
[3]: https://twitter.com/ArturoHerrero
