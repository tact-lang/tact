fun test_string() : String {
    return "Hello\nWorld";
}

contract TestContract {
    receive() {
        test_string();
    }
}
