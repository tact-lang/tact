const raw: Slice = rawSlice("000DEADBEEF000");

contract TestRawSlice() {
    // Return number of bits in the slice computed at runtime
    get fun getBits(): Int {
        return raw.bits();
    }

    // Dummy receiver
    receive() {}
}
