fun newLineString(): String {
    return "Hello\nWorld";
}

contract TestContract {
    receive() {
        newLineString();
    }
}
