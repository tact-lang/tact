contract TestRawSlice() {
    // Use rawSlice to obtain a slice from a raw string
    // This function rawSlice is compile-time evaluated
    const s: Slice = rawSlice("000DEADBEEF000");

    // Getter to expose the number of bits in the slice
    // Note: bits() is an extension function that returns the number of data bits
    get fun getSliceBits() : Int {
         return self.s.bits();
    }

    receive() {
         cashback(sender());
    }
}
