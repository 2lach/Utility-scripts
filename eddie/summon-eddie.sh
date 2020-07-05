#!/bin/sh

# Eddie my shipboard computer
if [[ -f "$HOME/utility-scripts/eddie/randline.py" ]]; then
  python3 $HOME/utility-scripts/eddie/randline.py $HOME/utility-scripts/eddie/greetings.txt $USER
fi
