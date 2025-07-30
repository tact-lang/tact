fun getMessage(): String {
    return "Hello Tact";
}

contract Test {
    receive() {
        getMessage();
    }
}
