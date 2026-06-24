contract A {
    // Parameterless contract
    receive() {}
}

contract Test {
    // Valid usage of initOf for a contract with no parameters
    // Note: initOf returns a StateInit which is a struct containing fields 'code' and 'data'
    get fun testInit() : StateInit {
         return initOf A();
    }
    
    // Valid usage of codeOf which returns a Cell containing the contract code
    get fun testCode() : Cell {
         return codeOf A;
    }

    receive() {}
}
