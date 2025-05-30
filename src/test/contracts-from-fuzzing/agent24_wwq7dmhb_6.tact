contract Test6 {
    receive() {
        test();
    }
}

fun test(): String {
    return "Hello, \u{263A}";
}