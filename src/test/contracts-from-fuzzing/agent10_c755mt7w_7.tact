contract StringTest {
    fun testBase64String(): Slice {
        return "SGVyZSdzIEpvaG5ueSE=".fromBase64();
    }
    receive() {
        self.testBase64String();
    }
}