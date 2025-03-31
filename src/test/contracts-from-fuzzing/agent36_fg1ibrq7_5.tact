contract TestStrings {
    fun testBase64(): Slice {
        return "SGVyZSdzIEpvaG5ueSE=".fromBase64();
    }
}