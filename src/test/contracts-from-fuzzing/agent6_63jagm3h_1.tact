contract Test {
    receive() {
        test();
    }
}

fun test(): String {
    return "Hello, Tact!";
}