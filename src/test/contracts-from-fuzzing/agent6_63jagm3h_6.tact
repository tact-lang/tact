contract Test {
    receive() {
        test();
    }
}

fun test(): String {
    return "Line1\nLine2";
}