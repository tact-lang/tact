contract TestNullOptional() {
    fun run() {
        // Test null literal and non-null assertion operator in a ternary expression
        let maybe: Int? = null;
        // If maybe is not null, unwrap it, otherwise use -1
        let result = maybe != null ? maybe!! : -1;
        dump(result); // Expected output: -1
    }
    
    receive() {
        self.run();
    }
}
