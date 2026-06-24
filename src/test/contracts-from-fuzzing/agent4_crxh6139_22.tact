/*
   TernaryTest verifies that the ternary operator ?: is right-associative in Tact.
   According to documentation, the ternary operator is right-associative.

   We test with two expressions:
   1. false ? 1 : (false ? 2 : 3) should evaluate to 3.
   2. false ? 1 : true ? 2 : 3 should evaluate to 2.

   If these evaluations are performed correctly, the require conditions will pass.
*/

contract TernaryTest() {
    receive() {
        // Ternary operator evaluations
        let a: Int = false ? 1 : (false ? 2 : 3);  // expected 3
        let b: Int = false ? 1 : true ? 2 : 3;       // expected 2, because ?: is right-associative
        require(a == 3, "Ternary operator test 'a' failed");
        require(b == 2, "Ternary operator test 'b' failed");
        cashback(sender());
    }
}
