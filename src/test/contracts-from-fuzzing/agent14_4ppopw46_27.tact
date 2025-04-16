contract TestRawSlice {
    receive() {
        // Test rawSlice() conversion from a hex string to a Slice and conversion back to String
        // "48656c6c6f205461637421" in hex is "Hello Tact!" in ASCII
        let s: String = rawSlice("48656c6c6f205461637421").asString();
        dump(s);
    }
}
