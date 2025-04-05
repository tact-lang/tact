contract OperatorTest {
    fun testOperators() {
         // Arithmetic: 5 + 4 - 5 * 4 / 5 % 4
         let a: Int = 5 + 4 - 5 * 4 / 5 % 4; // expected: 9
         dump(a);
         
         // Using parentheses
         let b: Int = (5 + (4 - 5)) * 4 / (5 % 4); // expected: 16
         dump(b);
         
         dump(1 % 5);  // expected: 1
         dump(1 % -5); // expected: -4
         
         // Unary and bitwise operations
         dump(-5);         // -5
         dump(~5);         // ~5 is bitwise NOT
         dump(-(~5));
         dump(~(-5));
         
         // Ternary operator: right-associative
         let t: Int = false ? 1 : (true ? 2 : 3); // expected: 2
         dump(t);
    }

    receive() {
         self.testOperators();
         cashback(sender());
    }
}
