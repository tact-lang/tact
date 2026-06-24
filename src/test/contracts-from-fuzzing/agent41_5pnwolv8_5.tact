contract TestAscii {
    // Using the compile-time function ascii to convert a string literal to an Int.
    receive() {
        let a: Int = ascii("abc"); // expected: 0x616263
    }
}
