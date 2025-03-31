contract Test1 {
    receive() {
        test();
    }
}

fun test(): String {
    return "Hello, world!";
}
