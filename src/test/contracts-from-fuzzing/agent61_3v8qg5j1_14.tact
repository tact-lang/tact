contract Test {
    receive() {
        // Test: Converting a String to a Slice and back
        let original: String = "Test 123";
        let sliceVal = original.asSlice();
        let converted: String = sliceVal.asString();
        dump(converted); // Expect output: "Test 123"
    }
}
