# GCCFind - A Selective C File Compiler

**GCCFind** is a script designed to simplify the compilation of C files based on specific keywords or patterns. When executed in a terminal, it offers flexibility through three essential parameters:

- **Directory Path:** This is the target directory where the script searches for C files containing the specified word or pattern.
- **Keyword or Pattern:** This serves as the search criterion. The script identifies and compiles C files that match this criterion.
- **Recursion Flag:** An optional flag that, when enabled, instructs the script to search recursively within subdirectories of the specified path, ensuring a comprehensive search across the entire directory structure.

This script streamlines the compilation process, allowing users to compile only those C files that meet their specific criteria. It's a valuable tool for developers and programmers.

## How To run

To execute this script, follow these steps:

1. Open a terminal window and paste this command:

   git clone https://github.com/guyreuveni33/DynamicDictionary.git

2. navigate to the directory where the script is located by this command:

    cd OperationSystemAss3

3. Use the following command template:

./gccfind.sh [path_to_directory] [word_to_search] [-r]

Annotation:

path_to_directory: Replace this with the directory you wish to search within.

word_to_search: Specify the word or pattern you want to locate.

-r flag: Include this flag if you want to enable recursive searching. Leave it out if you prefer a non-recursive search.

# Tennis Game - An Interactive Board Game
Tennis is a script that emulates an engaging two-player board game. Each player starts with a score of 50 points, and the game unfolds in rounds, with players making strategic choices by inputting a number between 0 and their remaining score.

<img src="https://i.postimg.cc/44Yr7Q80/image.png" width="700" height="300">
<img src="https://i.postimg.cc/8CqLyDSM/image.png" width="250" height="600">

## Game Rules
Initial Scores: Both players begin with 50 points.
First Round: At the commencement of the first round, a token is positioned in the middle column.
Turn Sequence: Players take alternating turns, selecting a number within the range of 0 to their available score.
Token Movement: The player who opts for the lower number shifts the token to their side of the board by one column.
Victory Conditions: The game concludes if any of the following scenarios occur:
A player's score dwindles to 0, resulting in their loss.
The token reaches an extreme position, either column -3 or 3, declaring the player on the opposite side as the victor.
Both players' scores reach 0 simultaneously, and the winner is determined by the token's position (Whoever maintains that the token is closer to their extreme column loses).
This script offers an interactive and dynamic board game experience, where strategic decision-making and a bit of luck play pivotal roles in determining the ultimate winner.

## How To run

Simply run the script directly in a Bash shell without requiring any user input or additional arguments.

Just follow these steps:

1. Open a terminal window and paste this command:

   git clone https://github.com/guyreuveni33/DynamicDictionary.git

3. navigate to the directory where the script is located by this command:
 
    cd OperationSystemAss3

4. Use the following command template:

./tennis.sh

Enjoy the game and happy coding!
