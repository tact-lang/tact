/* Test 16: Optional trailing semicolon in struct declaration
   According to the documentation, the last semicolon may be omitted in a struct declaration.
*/

struct MoviesToWatch {
    wolverine: String;
    redFunnyGuy: String
}

fun main() {
    let movie = MoviesToWatch{ wolverine: "Deadpool", redFunnyGuy: "Red", };
}
