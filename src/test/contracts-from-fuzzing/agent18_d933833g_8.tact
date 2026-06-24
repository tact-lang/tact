contract TestRawSlice() {
    // This contract tests the compile-time evaluation of rawSlice.
    // It should parse the given hexadecimal string into a Slice at compile time.
    get fun test(): Slice {
         return rawSlice("000DEADBEEF000");
    }
}
