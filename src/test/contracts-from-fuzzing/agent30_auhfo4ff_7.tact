contract TestRoundTrip {
    receive() {
        // Test: Converting a string to a slice and back to a string (roundtrip conversion)
        let s: String = "Roundtrip conversion test";
        let s_round: String = s.asSlice().asString();
        let dummy: Slice = s_round.asSlice();
    }
}
