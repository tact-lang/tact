fun test_inner_quotes(): String {
    // Test string literal containing escaped double quotes
    return "He said \"Hello, world!\" to everyone.";
}

contract TestContract {
    receive() {
        test_inner_quotes();
    }
}
