fun multiline(): String {
    return "Hello\nWorld";
}

contract Test {
    receive() {
        let x = multiline();
    }
}
