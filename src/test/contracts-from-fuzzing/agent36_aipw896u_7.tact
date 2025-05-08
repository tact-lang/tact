contract StringAsSliceTest {
    receive() {
        // Define a string literal with Unicode escape sequences
        let original: String = "Unicode test: \u2764 and \u{1F602}"; // ♥ and 😂
        // Convert it to a slice and back to a string
        let roundTrip: String = original.asSlice().asString();

        // Compare the hash data of both strings to verify they are equivalent
        let h1: Int = original.hashData();
        let h2: Int = roundTrip.hashData();

        // Using dump to output the hash values for manual verification
        dump(h1);
        dump(h2);
    }
}
