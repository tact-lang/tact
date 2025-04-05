contract TestPrecedence {
    receive() {
       // Multiplication has higher precedence than addition
       let a: Int = 5 + 3 * 2;    // should be 5 + (3*2) = 11
       // Parentheses alter the grouping: (5+3)*2 = 16
       let b: Int = (5 + 3) * 2;
       dump(a);
       dump(b);
    }
}
