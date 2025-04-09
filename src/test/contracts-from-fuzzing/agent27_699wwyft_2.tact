contract TestString {
    receive() {
        test();
    }
}

fun test(): String {
    return "Hello, world!";
}
