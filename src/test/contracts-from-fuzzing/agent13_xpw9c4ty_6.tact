contract OptionalExprTest() {
    fun test() {
        // Test optional expressions with null and non-null assertion
        let x: Int? = null;
        // Reassign x to a non-null value
        x = 42;
        // Using non-null assertion operator to access value
        dump(x!!); // Should output 42
    }
    
    receive() {
        self.test();
    }
}
