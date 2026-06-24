contract TestTernary {
    receive() {
        // Simple ternary expression
        let a: Int = true ? 1 : 2;
        
        // Nested ternary; alternative case does not require extra parentheses
        let b: Int = false ? 1 : false ? 2 : 3; // should evaluate as 3
        
        // Nested ternary with parentheses to clarify consequence case
        let c: Int = false ? (false ? 1 : 2) : 3; // evaluates to 3
    }
}
