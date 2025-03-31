contract HashTest {
    fun testHashData(): Int {
        let s: String = "Hash this string!";
        return s.hashData();
    }
    receive() {
        self.testHashData();
    }
}