contract TestComplexLogicalTernary {
    receive() {
        // Combining logical operators with a ternary operator in a complex expression
        // Condition: (!false && (true || !false)) should evaluate to true
        // Consequence: (10 - 3) * 2, i.e. (7 * 2) = 14
        // Alternative: 0
        let x: Int = (!false && (true || !false)) ? (10 - 3) * 2 : 0;
        dump(x); // expected output: 14
    }
}
