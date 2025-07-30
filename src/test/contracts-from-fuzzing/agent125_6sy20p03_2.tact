contract Test {
    receive() {}
}

contract Wrapper {
    receive() {
        let init_cell = initOf Test();
        let code_cell = codeOf Test;
    }
}
