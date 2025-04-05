fun test_string(): String {
    return "Hello, Tact!";
}

contract TestString {
    receive() {
        test_string();
    }
}
