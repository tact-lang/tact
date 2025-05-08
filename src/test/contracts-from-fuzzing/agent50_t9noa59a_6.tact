contract SelfTest {
    receive() {
         // Testing codeOf for current contract: should be equal to myCode()
         let a = myCode();
         let b = codeOf SelfTest;
         a == b; // should be true
    }
}
