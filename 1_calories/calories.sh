#!/usr/bin/env bash

declare -x MAX_CAL
declare -a CAL_ARR

awk -v RS= '{print > ("ELF-" NR)}' "$(dirname "${BASH_SOURCE[0]}")"/LIST.txt

for file in ELF-*; do
    CAL=$(awk '{ sum += $1 } END { print sum }' "$file")
    if [[ $CAL -gt $MAX_CAL ]]; then
        MAX_CAL=$CAL
    fi
    CAL_ARR+=("${CAL}")
done

echo "$MAX_CAL"
# shellcheck disable=SC2207
IFS=$'\n' sorted=($(sort -nr <<<"${CAL_ARR[*]}"))
unset IFS
echo "$((sorted[0]+sorted[1]+sorted[2]))"
rm ELF-*
