# bart

Print bar graphs in your shell.

**bart** takes a list of data and plots a chart with rectangular horizontal bars
with lengths proportional to the values represented.


## Install

**bart** is a [shell script][1], so drop it somewhere and make sure it's added
to your `$PATH`.


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

    $ echo 2013 1 2014 7 | bart
    2013: █ 1
    2014: ███████ 7


[1]: https://github.com/arturoherrero/bart/blob/master/bart
