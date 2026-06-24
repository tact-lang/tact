contract TestOperators {
    // Test arithmetic operator precedence:
    // 2 + 3 * 4 = 2 + 12 = 14
    // (2 + 3) * 4 = 5 * 4 = 20
    // Sum = 34
    fun testPrecedence(): Int {
         let a: Int = 2 + 3 * 4;
         let b: Int = (2 + 3) * 4;
         return a + b;
    }
    
    // Test logical operators precedence:
    // b && c || !c: if c is false then !c is true, else b && c.
    fun testLogical(b: Bool, c: Bool): Bool {
         return b && c || !c;
    }
    
    // Test augmented assignments:
    // Starting with x, then:
    // result += 5 => x + 5
    // result -= 2 => x + 3
    // result *= 3 => 3*(x + 3)
    // result /= 2 => integer division of 3*(x+3) by 2
    fun testAugmented(x: Int): Int {
         let result: Int = x;
         result += 5;
         result -= 2;
         result *= 3;
         result /= 2;
         return result;
    }
    
    receive() {}
}
