/// Test Case 1: Valid usage with a contract having parameters
contract WithParams(param: Int,) {
    // Contract with parameters using implicit init()
    receive() {}
}

contract TesterValid {
    // Getter function to force evaluation of initOf and codeOf
    get fun test(): Cell {
         let s: StateInit = initOf WithParams(42,);
         let c: Cell = codeOf WithParams;
         return c;
    }

    receive() {}
}
