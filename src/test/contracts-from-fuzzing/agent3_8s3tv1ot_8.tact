fun emptyString(): String {
    return "";
}

contract Test {
    receive() {
        let x = emptyString();
    }
}
