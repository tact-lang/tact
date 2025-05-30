contract TestRawSliceTooManyBits {
    // 256 hex digits = 256*4 = 1024 bits, which should exceed the allowed 1023 bits
    s: Slice = rawSlice("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
    receive() {}
}
