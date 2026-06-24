fun get_message(): String {
    return "Hello, Tact!";
}

contract Test {
    receive() {
        get_message();
    }
}
