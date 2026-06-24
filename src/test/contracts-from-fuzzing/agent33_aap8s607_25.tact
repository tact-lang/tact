contract TestNullLiteral {
    receive() {
        // Testing 'null' literal usage with optional types
        let a: Int? = null;          // Valid null assignment for an optional integer
        let b: Int? = 123;           // Non-null assignment
        
        // Test conditional using a null check and non-null assertion operator
        let c: Int = b != null ? b!! : 0;  // should evaluate to 123
    }
}
