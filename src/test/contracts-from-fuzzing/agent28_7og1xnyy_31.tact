contract TestStringRoundTrip {
    receive() {
        // Test that converting a String to a Slice and back yields an equivalent string.
        let original: String = "RoundTripTest";
        let roundTrip: String = original.asSlice().asString();
        dump(original == roundTrip);
    }
}
