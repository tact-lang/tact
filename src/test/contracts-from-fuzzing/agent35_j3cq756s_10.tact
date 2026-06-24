contract ParenthesisPrecedence {
    receive() {
        // Operator precedence without parentheses: 1 + 2 * 3 = 7
        let a = 1 + 2 * 3;
        
        // With parentheses: (1 + 2) * 3 = 9
        let b = (1 + 2) * 3;
        
        // Ternary operator without extra parentheses for the false branch:
        // false ? 1 + 2 : 3 + 4  => should evaluate the false branch: 3 + 4 = 7
        let c = false ? 1 + 2 : 3 + 4;
        
        // Ternary operator with parentheses in the consequence branch
        // true ? (1 + 2) : 3 + 4  => should evaluate the true branch: 1 + 2 = 3
        let d = true ? (1 + 2) : 3 + 4;
    }
}
