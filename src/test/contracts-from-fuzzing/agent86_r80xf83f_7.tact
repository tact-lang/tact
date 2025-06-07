contract StringTest {
    // Test string hashData
    fun testHashData(): Int {
        let str: String = "Hello, Tact!";
        return str.hashData(); // Should return hash of string
    }
}