contract Test {
    // Testing compile-time function rawSlice() with a hex string that exceeds the allowed maximum of 1023 bits.
    // 256 hex digits represent 1024 bits, which should trigger an error as only up to 1023 bits are allowed.
    stored: Slice = rawSlice("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");

    receive() {}
}
