contract TestStrings {
    fun testBase64Decode(): Slice {
        return "SGVyZSdzIEpvaG5ueSE=".fromBase64();
    }
}