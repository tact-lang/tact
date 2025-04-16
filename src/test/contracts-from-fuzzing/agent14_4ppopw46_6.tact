contract TestConversion {
    receive() {
        // Test round-trip conversion between String and Slice
        let s: String = "RoundTrip";
        let s2: String = s.asSlice().asString();
        dump(s2);
    }
}
