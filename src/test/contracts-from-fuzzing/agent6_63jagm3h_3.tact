contract Test {
    receive() {
        test();
    }
}

fun test(): String {
    return "This is a \"double quote\" in a string.";
}