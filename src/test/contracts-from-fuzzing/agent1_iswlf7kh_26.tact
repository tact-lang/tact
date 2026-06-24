contract TestRoundtripConversion {
    receive() {
        // Test conversion from String to Slice and back to String, ensuring round-trip consistency
        let original: String = "Roundtrip Test - 🌟";
        let roundtrip: String = original.asSlice().asString();
        let equal: Bool = original.asSlice() == roundtrip.asSlice();
    }
}
