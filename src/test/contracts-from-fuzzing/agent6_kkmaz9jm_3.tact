contract TernTest {
    // Test ternary operator precedence and evaluation
    fun test(): Int {
         let a: Int = (true ? 10 : 20) + (false ? 30 : 40);
         return a; // Expected: 10 + 40 = 50
    }
    
    receive() {
         self.test();
    }
}
