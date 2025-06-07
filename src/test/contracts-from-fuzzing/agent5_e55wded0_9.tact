contract D {}

contract Test {
    receive() {
         // Test Case 6: Contract with implicit empty init
         let s: StateInit = initOf D();
         let c: Cell = codeOf D;
    }
}
