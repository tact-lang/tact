fun weirdUnicodeEscape(): String {
    return "Hello\u0041";
}

contract Test {
    receive() {
        let x = weirdUnicodeEscape();
    }
}