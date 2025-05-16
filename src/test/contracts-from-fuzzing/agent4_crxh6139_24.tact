/*
   BitOpsTest verifies that bitwise operators behave as documented:

   According to the documentation (see the Operators section),
   ~5 should yield -6, -(~5) should yield 6, and ~(-5) should yield 4.

   Additionally, left bitwise shift of 5 by 2 (5 << 2) should yield 20.

   This contract checks these operations in its receive() function.
*/

contract BitOpsTest() {
    receive() {
        let a = ~5;          // Expected: -6
        require(a == -6, "~5 did not equal -6");
        
        let b = -(~5);       // Expected: 6
        require(b == 6, "-(~5) did not equal 6");
        
        let c = ~(-5);       // Expected: 4
        require(c == 4, "~(-5) did not equal 4");
        
        let d = 5 << 2;      // Expected: 20
        require(d == 20, "5 << 2 did not equal 20");
        
        cashback(sender());
    }
}
