/* Test Case 6: Using codeOf for the current contract (should be equivalent to myCode()) */
contract SelfTest {
    receive() {
        let code1 = codeOf SelfTest;
        let code2 = myCode();
        // Just a dummy check to use both expressions
        // For debugging purposes, we check that their hashes are equal
        // (Assuming that cells can be compared using '==' operator)
        let _ = code1 == code2;
    }
}
