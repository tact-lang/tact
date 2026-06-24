contract TestParseStdAddressFailure {
    // This contract intentionally provides an invalid slice to trigger cell underflow in parseStdAddress
    fun test() {
         // Build a slice that doesn't have enough bits to form a valid StdAddress
         let s: Slice = beginCell().storeUint(0, 2).asSlice();
         // This should throw a runtime exception with exit code 9 (Cell underflow)
         let _ = parseStdAddress(s);
    }
}
