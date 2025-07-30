contract TestRawSlice() {
    // Use compile-time function rawSlice to create a Slice from a hex string
    const TEST_SLICE: Slice = rawSlice("000DEADBEEF000");

    // Return the number of bits in the slice
    get fun getSliceBits() : Int {
         return self.TEST_SLICE.bits();
    }
}
