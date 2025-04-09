contract Test {
    // Test 17: Testing rawSlice() with a hex string representing 1024 bits (256 hex digits), which exceeds the allowed 1023 bits limit.
    // We generate a 256-character hex string of zeros. Each hex digit is 4 bits, so 256*4 = 1024 bits.
    // Expected behavior: The compiler should emit an error because the input exceeds the allowed limit.
    stored: Slice = rawSlice("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    
    receive() {}
}
