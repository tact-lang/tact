contract TestStringIndexExtraction {
    receive() {
        // Extract first character code from string
        let s: String = "Test";
        // Convert string to slice and load first 8 bits
        let firstChar: Int = s.asSlice().loadUint(8);
    }
}
