contract TestRawSliceOdd {
    // Testing rawSlice with bit-padding: input has an underscore and an odd number of hex digits
    // Expected behavior: if the implementation validates correctly, it should throw a compile-time error due to odd hex digits, unless it rounds appropriately.
    stored: Slice = rawSlice("4a3_");

    receive() {}
}
