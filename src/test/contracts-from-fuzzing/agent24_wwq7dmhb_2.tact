contract Test2 {
    receive() {
        test();
    }
}

fun test(): String {
    return "Hello\tworld!\n";
}