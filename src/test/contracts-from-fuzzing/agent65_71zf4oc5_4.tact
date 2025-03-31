contract TestStringOperations {
    receive() {
        let original: String = "Hello, Tact!";
        let base64: Slice = original.fromBase64();
        let sliced: Slice = original.asSlice();
        // Dummy operations for testing
        let result: Int = sliced.bits(); // Count number of bits in the string
    }
}