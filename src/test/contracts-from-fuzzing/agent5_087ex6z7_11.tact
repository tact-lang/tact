contract Test {
    // Testing compile-time function rawSlice() with a bit-padded hex input that does not require further evaluation.
    // This should successfully compile and embed the slice into the contract.
    stored: Slice = rawSlice("4a_");

    receive() {}
}
