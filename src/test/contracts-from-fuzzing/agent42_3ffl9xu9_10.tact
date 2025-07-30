contract TestPrecedence {
    receive() {
        // Operator precedence: multiplication before addition
        let a: Int = 1 + 2 * 3;         // expected 7
        let b: Int = (1 + 2) * 3;         // expected 9
        
        // Ternary operator with right associativity for alternative cases
        let c: Int = false ? 1 : true ? 2 : 3;   // expected 2
        
        // Unary operator vs subtraction ambiguity
        let d: Int = 5 + -5;   // expected 0 (unary negation applied to 5)
        let e: Int = 5 -5;     // expected 0 (subtraction operator applied with adjacent number)
    }
}
