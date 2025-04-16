contract Base64ValidTest {
    receive() {
        // Test using fromBase64 on a valid Base64 string
        let s: String = "SGVyZSdzIEpvaG5ueSE="; // "Here's Johnny!" in Base64
        let decoded: Slice = s.asSlice().fromBase64();
        dump(decoded);
    }
}
