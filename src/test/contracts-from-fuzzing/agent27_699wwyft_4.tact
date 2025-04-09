contract TestStringEscape {
    receive() {
        test();
    }
}

fun test(): String {
    return "Hello \" world";
}
