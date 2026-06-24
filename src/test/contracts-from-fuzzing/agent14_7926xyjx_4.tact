fun greetEmpty(): String {
    return "";
}

contract Test {
    receive() {
        greetEmpty();
    }
}