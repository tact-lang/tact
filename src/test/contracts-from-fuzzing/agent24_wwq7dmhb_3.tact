contract Test3 {
    receive() {
        test();
    }
}

fun test(): String {
    return "Quotes in string: \"Hello\"";
}
