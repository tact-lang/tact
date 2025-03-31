contract Test {
    // Test: using ascii function on a string with exactly 32 bytes (edge case) should compile successfully
    a: Int = ascii("12345678901234567890123456789012");

    receive() {
        // Round-trip conversion test on a string with multiple Unicode escapes
        let original: String = "Unicode: \u{1F600} \u{1F601}";
        let roundTrip: String = original.asSlice().asString();
        if (original != roundTrip) {
            throw(1);
        }
    }
}
