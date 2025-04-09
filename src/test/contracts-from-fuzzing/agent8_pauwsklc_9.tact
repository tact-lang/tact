fun multiLine(): String {
    return "Hello
World";
}

contract Test {
    receive() {
        multiLine();
    }
}
