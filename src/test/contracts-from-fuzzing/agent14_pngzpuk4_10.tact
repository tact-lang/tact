contract TestSHA256() {
    fun run() {
        // Testing compile-time evaluation of sha256
        let hashValue: Int = sha256("test");
        dump(hashValue);
    }
    
    receive() {
        self.run();
    }
}
