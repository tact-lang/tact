contract TestStringRoundTrip {
    receive() {
        // Create a string literal and round-trip it through asSlice() and asString()
        let s: String = "RoundTripTest";
        let s2: String = s.asSlice().asString();
        // Compare s and s2, dumping 1 if equal, 0 otherwise
        if (s == s2) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
