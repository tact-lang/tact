// Scenario F: Using wildcard as a global function parameter (valid as discard)
fun unusedParam(_: Int) {}

contract Test {
    receive() {
        // Calling function with discarded parameter
        unusedParam(123);
    }
}
