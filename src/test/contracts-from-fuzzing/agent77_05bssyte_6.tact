contract TestStringHash {
    fun testHashData(): Int {
        let s: String = "Hello, Tact!";
        return s.hashData();
    }
}