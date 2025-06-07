fun getString(): String {
    return "Test123";
}

contract Test {
    receive() {
        getString();
    }
}