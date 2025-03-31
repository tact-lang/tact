contract Test13 {
    receive() {
        test();
    }
}

fun test(): String {
    return "Max is \u{10FFFF}";
}
