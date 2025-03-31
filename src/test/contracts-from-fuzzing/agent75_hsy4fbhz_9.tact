contract Test {
    fun test_str(s: String): Int {
        return s.hashData();
    }
    
    receive() {
        let result: Int = self.test_str("Hello");
    }
}
