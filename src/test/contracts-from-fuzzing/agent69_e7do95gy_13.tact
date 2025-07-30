fun processString(s: String): Int {
    return s.hashData();
}

contract TestFunctionString {
    receive() {
        // Test 13: Passing a string literal to a function that uses it
        let result: Int = processString("Test string submission");
    }
}
