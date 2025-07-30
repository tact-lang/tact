fun getString(): String {
    return "Hello, world!";
}

contract Test {
    receive() {
        getString();
    }
}
