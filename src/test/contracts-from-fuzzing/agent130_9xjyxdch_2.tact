contract Test1 {
    receive() {}
}

contract Caller {
    receive() {
        // Correct usage: a contract without parameters needs an empty parameter list for initOf
        let init_cell = initOf Test1();
        let code_cell = codeOf Test1;
    }
}
