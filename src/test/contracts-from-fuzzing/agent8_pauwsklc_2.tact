fun getMessage(): String {
    return "Hello\nTact";
}

contract Test {
    receive() {
        getMessage();
    }
}
