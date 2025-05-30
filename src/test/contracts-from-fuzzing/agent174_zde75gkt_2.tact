contract Test {
    // minimal contract
    receive() {}
}

contract Caller {
    receive() {
         let init_state = initOf Test();
         let code_cell = codeOf Test;
    }
}
