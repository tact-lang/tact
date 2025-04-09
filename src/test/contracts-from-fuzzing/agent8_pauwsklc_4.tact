fun emptyString(): String {
    return "";
}

contract Test {
    receive() {
        emptyString();
    }
}
