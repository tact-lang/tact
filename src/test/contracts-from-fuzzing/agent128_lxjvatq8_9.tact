/* Test Case 7: Verify that codeOf for the current contract equals myCode() */

contract D {
    receive() {
         let a = codeOf D;
         let b = myCode();
         // Compare the two cells
         a == b;
    }
}
