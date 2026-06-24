contract TestA {
    receive() {}
}

contract Caller {
    receive() {
         // Valid usage with explicit empty parameters for initOf
         let init_cell = initOf TestA();
         let code_cell = codeOf TestA;
    }
}
