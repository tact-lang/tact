contract ExpressionTest {
    // Constant to test self field access
    const MY_CONST: Int = 10;

    fun test(): Int {
        // Test integer literal with underscore
        let integerLiteral = 1_000;
        
        // Test boolean literal
        let boolLiteral = true;
        
        // Test string literal and escape sequences
        let stringLiteral = "Hello, \"World\"\n";
        
        // Test null literal
        let nullLiteral: Int? = null;
        
        // Test self reference and field access
        let constVal = self.MY_CONST;
        
        // Test compile-time function: ascii (should convert a 1-character string to Int)
        let asciiVal = ascii("A");
        
        // Test global function now() which returns current timestamp (although it won't be computed at compile time)
        let _now = now();
        
        // Combine some expressions: integerLiteral + constVal + asciiVal
        return integerLiteral + constVal + asciiVal;
    }
    
    receive() {
        let result = self.test();
        result;
    }
}
