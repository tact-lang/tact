contract Test {
    receive() {
        test();
    }
}

fun test() {
    let paddedSlice = rawSlice("4_"); // Just one byte 0x34 but bit-padded
    let s: String = paddedSlice.asString();
    let h = s.hashData(); // Should throw if string bits are not multiple of 8
}
