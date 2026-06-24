contract TestTernary {
    fun showcase() {
        // Test the ternary operator expression.
        // According to documentation, false ? 1 : (false ? 2 : 3) should evaluate to 3.
        dump(false ? 1 : (false ? 2 : 3));
    }
    
    receive() {
        self.showcase();
    }
}