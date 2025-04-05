contract TestOptionalAccess() {
    fun run() {
        // Test non-null assertion operator on an optional value
        let maybe: Int? = 123;
        let val = maybe!!; // Should yield 123
        require(val == 123, "Optional access failed");
    }
    
    receive() {
        self.run();
    }
}
