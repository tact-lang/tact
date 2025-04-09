contract Test {
    receive() {
        // Test converting a raw hex encoded string to a Slice, then to String using asString()
        // The hex string "48656c6c6f2c205461637421" corresponds to "Hello, Tact!"
        let sl: Slice = rawSlice("48656c6c6f2c205461637421");
        let s: String = sl.asString();
        dump(s); // Expected output: "Hello, Tact!"
    }
}
