contract Test {
    receive() {
        // Testing conversion from String to Slice and back to String
        let s: String = "Roundtrip test";
        let t: String = s.asSlice().asString();
        dump(s == t);
    }
}
