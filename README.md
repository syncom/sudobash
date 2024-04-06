# A Sudoku Solver in Bash

This is a Sudoku solver I wrote a long long time ago out of pure boredom, in
Bourne-again shell (Bash). It uses tools like `echo`, `grep`, and `sed`, and
runs really slow. But who cares if there is some time to kill!

To use it, put all 81 numbers in the puzzle, from the top row to the bottom with
empty cells replaced by zeros, into the first line of a text file, say
`sample_puzzle.txt`, and from shell prompt, run

```bash
./sudobash sample_puzzle.txt
```

Example:

```bash
$ echo "000381000123000600500007030204006080006000200090100306030800005005003427000045000" > sample_puzzle.txt
$ ./sudobash sample_puzzle.txt
647381592123459678589267134214536789356798241798124356431872965865913427972645813
```
