contract TestTernaryOps {
    receive() {
        // Test nested ternary operators
        // Case 1: Using parentheses for alternative case
        let v1: Int = false ? 1 : (false ? 2 : 3); // Expected 3
        
        // Case 2: Without additional parentheses (alternative part implicitly right-associative)
        let v2: Int = false ? 1 : false ? 2 : 3; // Expected 3
        
        // Case 3: Different condition resulting in different evaluation
        let v3: Int = false ? 1 : true ? 2 : 3;  // Expected 2
    }
}
