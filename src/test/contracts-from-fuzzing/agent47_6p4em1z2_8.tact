contract TestParenthesesPrecedence {
    receive() {
       // Test operator precedence without parentheses vs with parentheses
       let a: Int = 1 + 2 * 3;   // Expected: 1 + (2 * 3) = 7
       let b: Int = (1 + 2) * 3; // Expected: (1 + 2) * 3 = 9
       dump(a.toString());
       dump(b.toString());
   }
}
