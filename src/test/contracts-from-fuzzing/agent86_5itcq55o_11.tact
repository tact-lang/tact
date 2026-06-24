/// Test Case 2: Self contract usage without assertion

contract SelfTestSimple {
    // This contract uses codeOf and myCode for the current contract
    get fun getCode(): Cell {
         let a: Cell = codeOf SelfTestSimple;
         let b: Cell = myCode();
         // We don't assert equality, just use both expressions
         let dummy: Cell = a; // use a so that both are evaluated
         return dummy;
    }

    receive() {}
}
