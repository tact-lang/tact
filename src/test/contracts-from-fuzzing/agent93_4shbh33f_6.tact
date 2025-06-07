contract TestStringHashData {
    receive() {
        // Test hashData extension function on strings
        let s: String = "Hello, Tact!";
        let h: Int = s.hashData();
    }
}
