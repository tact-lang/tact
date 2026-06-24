contract StringTest {
    fun testBase64Encoding(): Slice {
        return "SGVyZSdzIEpvaG5ueSE=".fromBase64();
    }
}
