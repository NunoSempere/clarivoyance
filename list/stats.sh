#!/bin/bash

num_1_star=$(cat index.md | grep " ★ " | wc -l)
num_2_stars=$(cat index.md | grep " ★★ " | wc -l)
num_3_stars=$(cat index.md | grep " ★★★ " | wc -l)

echo $num_1_star ★
echo $num_2_stars ★★
echo $num_3_stars ★★★

