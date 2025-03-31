contract StringTester {
    receive() {
        // Test escape sequences
        let stringWithEscape: String = "Hello, \n World!";
        // Use String.asSlice to see how it handles the string
        let sliceVersion: Slice = stringWithEscape.asSlice();
        // Dump the slice length directly
        dump(sliceVersion.bits()); // Should contain actual bit length without newlines
    }
}