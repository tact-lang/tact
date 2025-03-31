// Snippet 2: Valid usage - Using wildcard as a global function parameter
// According to documentation, naming a parameter as underscore indicates that the parameter is unused.

fun f(_: Int): Int {
    return 1;
}

contract Test {
    receive() {
        // Call the function to ensure it's compiled
        let res: Int = f(42);
        dump(res);
    }
}
