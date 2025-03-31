contract TestStringNewline {
    receive() {
        test2();
    }
}

fun test2(): String {
    return "Hello\nWorld";
}
