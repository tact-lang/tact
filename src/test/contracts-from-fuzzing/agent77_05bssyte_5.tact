contract TestStringBase64 {
    fun testBase64(): Slice {
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let fizz: Slice = s.fromBase64();
        return fizz;
    }
}