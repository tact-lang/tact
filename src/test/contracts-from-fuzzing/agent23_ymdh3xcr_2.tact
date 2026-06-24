fun escapeString(): String {
    // This string includes a newline escape sequence and an escaped double quote
    return "Hello\n\"World\"";
}

contract Test {
    receive() {
        let s: String = escapeString();
        dump(s);
    }
}
