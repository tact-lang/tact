contract TestRawSliceBitPadded {
    // Using a bit-padded hex string: "4a_" should yield a slice that, when interpreted as 6 bits, equals 18
    stored: Slice = rawSlice("4a_");

    fun main(): Int {
        return self.stored.loadUint(6);
    }
}
