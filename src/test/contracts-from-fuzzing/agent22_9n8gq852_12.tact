contract Test {
    receive() {
        test();
    }
}

fun test(): String {
    // Testing \u escape sequence
    return "Hello \u0061 World";
}
