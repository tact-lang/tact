contract TestUnaryOperators {
    fun showcase(): Int {
        // Evaluate unary expressions: using five = 5:
        //   -(~5) should evaluate to 6, ~(-5) should evaluate to 4, sum = 10
        let a: Int = -(~5);
        let b: Int = ~(-5);
        return a + b; // Expected: 10
    }
    
    receive() {
        // Use self.showcase() for contract-level functions
        let result = self.showcase();
        result;
    }
}
