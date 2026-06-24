/*
   DivTest verifies the behavior of the division operator in Tact, which rounds toward -∞.
   According to the documentation, for example:
     3 / 2 should yield 1
     -3 / 2 should yield -2
*/

contract DivTest() {
    receive() {
        let a: Int = 3 / 2;  // Expected: 1
        let b: Int = -3 / 2; // Expected: -2
        require(a == 1, "3/2 did not yield 1");
        require(b == -2, "-3/2 did not yield -2");
        cashback(sender());
    }
}
