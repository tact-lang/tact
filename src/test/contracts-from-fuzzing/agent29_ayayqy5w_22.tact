contract Test {
    receive() {
        // Test round-trip conversion: String -> Slice -> String, then check equality
        let s: String = "RoundTripTest";
        let s2: String = s.asSlice().asString();

        // Since Tact does not support direct string equality with "!=",
        // we use the documented '==' operator for strings.
        if (!(s == s2)) {
            throw(1);
        }
    }
}
