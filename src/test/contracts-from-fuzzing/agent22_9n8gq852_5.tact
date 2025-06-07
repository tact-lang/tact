contract Test {
    receive() {
        test();
    }
}

fun test(): String {
    // Testing a valid hex escape sequence
    return "Hello\x41World";
}
