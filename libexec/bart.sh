#!/usr/bin/env bash

help() {
  echo "
  USAGE:
  $ bart [-h|--help] LABEL VALUE ...

  EXAMPLE:
  $ bart 2013 1 2014 7
  2013: █ 1
  2014: ███████ 7

  $ echo 2013 1 2014 7 | bart
  2013: █ 1
  2014: ███████ 7
  "
}

label() {
  printf "%s:" "$1"
  for i in $(seq 0 $(($2 - ${#1}))); do
    printf " "
  done
}

bar() {
  local slimtick="|"
  local tick=█

  if [ "$1" -eq 0 ]; then
    printf "%s" $slimtick
  else
    for i in $(seq 1 "$1"); do
      printf "%s" $tick
    done
  fi
}

graph() {
  local labels=()
  local values=()

  if [ $(($# % 2)) -eq 0 ]; then
    arguments=("$@")
    for i in "${!arguments[@]}"; do
      if [ $(("$i" % 2)) -eq 0 ]; then
        labels+=("${arguments[$i]}")
      else
        values+=("${arguments[$i]}")
      fi
    done

    local max_label=1
    for i in "${labels[@]}"; do
      (( ${#i} > max_label )) && max_label="${#i}"
    done

    local max_value=1
    for i in "${values[@]}"; do
      (( $(echo "$i > $max_value" | bc -l) )) && max_value=$i
    done

    local max_length=100
    local scale=$max_value
    (( $(echo "$max_value > $max_length" | bc -l) )) && scale=$max_length

    while [ $# -gt 0 ]; do
      printf "%s\n" "$(label "$1" "$max_label")$(bar "$(echo "$2"*"$scale"/"$max_value" | bc)") $2"
      shift 2
    done
  else
    echo "$0": need a pair number of arguments
    help
    exit 1
  fi
}

if [ "$1" == '-h' ] || [ "$1" == '--help' ]; then
  help
  exit 0
fi

if ! [ -t 0 ]; then
  declare -a args
  args=($(</dev/stdin))
  set -- "${args[@]}"
fi
graph "$@"
