fun test_trailing_backslash() : String {
    return "Hello\\";
}

contract TestContract {
    receive() {
        test_trailing_backslash();
    }
}
