contract Test {
    receive() {
        test();
    }
}

fun test(): String {
    // Attempting multiline string literal
    return "Hello
World";
}
