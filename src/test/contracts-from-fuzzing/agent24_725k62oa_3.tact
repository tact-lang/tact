contract TestArith {
    fun testArithmetic() {
       // Testing operator precedence: multiplication before addition
       let a = 5 + 3 * 2; // expected: 5 + (3 * 2) = 11
       dump(a);
       // Testing explicit grouping with parentheses
       let b = (5 + 3) * 2; // expected: 8 * 2 = 16
       dump(b);
    }
    receive() {
       self.testArithmetic();
    }
}
