contract E(x: Int, ) {
    receive() {}
}

contract Test {
    receive() {
         // Test Case 7: Contract with trailing comma in parameter list
         let s: StateInit = initOf E(100);
         let c: Cell = codeOf E;
    }
}
