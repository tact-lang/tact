contract Test {
    receive() {
        test();
    }
}

fun test(): String {
    // Testing a large Unicode code point ~ 0x100000 (6 hex digits)
    return "Large code point: \u{100000}";
}