contract Test {
    receive() {
        // Testing String.fromBase64 with a valid Base64 encoded string
        let s: String = "SGVyZSdzIEpvaG5ueSE="; // "Here's Jonny!"
        let slice: Slice = s.fromBase64();
        // Testing String.hashData on a string with bits divisible by 8
        let hashValue: Int = "Test1234".hashData();
    }
}
