contract Base64Test {
    fun testBase64(): Slice {
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        return s.fromBase64();
    }
    receive() {
        self.testBase64();
    }
}