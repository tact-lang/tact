/// Test case: Convert String to Slice using extension function
contract TestStringAsSlice {
    fun run() {
        let s: String = "test string";
        // Convert string to slice using provided extension
        let slice: Slice = s.asSlice();
        // Dump the total number of bits in the slice (non-zero if conversion is successful)
        dump(slice.bits());
    }
    receive() {
        self.run();
    }
}
