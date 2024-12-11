primitive Int;

fun foo(v: Int): Int {
    let a: Int = 7;
    let x: Int = 10;
    if (v > 0 && v < 10) {
        a = 10;
        return 0;            // The return ensures that "a" CANNOT be 20 once the conditionals finish
    } else if (x >= 10) {    // if program reaches "else if", condition is always true, because x does not get modified
        if (v > 7) {
            a = 12;          
            return 9;        // The return ensures that "a" CANNOT be 12 once the conditionals finish
        }
        a = 20;              // The "else if" branch always assigns a = 20
    } else {
        a = 5;               // This assignment gets ignored because the program never reaches it
    }
    return 1 / (a - 20);   // The only surviving path is a = 20. Division by zero.
}                           