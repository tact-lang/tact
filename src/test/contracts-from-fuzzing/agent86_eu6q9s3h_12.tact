contract TestParen {
    fun parenReturn(x: Int): Int {
         return (x);
    }

    // Test with nested parentheses in return expression
    fun nestedParenReturn(y: Int): Int {
         return (((y + 10)));
    }

    // Test mixing arithmetic in return with parentheses
    fun arithmeticReturn(z: Int): Int {
         return (z * 2 + (5));
    }
}
