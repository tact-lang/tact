contract ParamContract(param: Int,) {
    // Using contract parameters with implicit empty init
    receive() {}
}

contract Tester2 {
    // Testing initOf and codeOf with a contract that has parameters
    get fun test(): Cell {
         let s: StateInit = initOf ParamContract(42,);
         let c: Cell = codeOf ParamContract;
         // Return code cell to use the expressions and avoid warnings
         return c;
    }

    receive() {}
}
