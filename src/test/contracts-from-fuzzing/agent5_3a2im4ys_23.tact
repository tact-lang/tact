contract TestLogicalOperators {
    receive() {
        // Testing logical operators
        let a: Bool = true && false; // Expected: false
        let b: Bool = true || false; // Expected: true
        
        // Testing comparison in logical context
        let c: Bool = (10 > 5) && (2 < 3); // true && true = true
    }
}
