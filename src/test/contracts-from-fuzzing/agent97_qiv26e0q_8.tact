contract SelfTest {
    receive() {
         let a = myCode();
         let b = codeOf SelfTest;
         // Implicitly, a should be equal to b, although runtime equality check is not performed here.
    }
}
