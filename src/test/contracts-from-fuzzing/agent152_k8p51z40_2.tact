contract Simple {
    receive() {}
}

contract Caller {
    receive() {
        // Valid usage with a contract with no init parameters
        let init_cell = initOf Simple();
        let code_cell = codeOf Simple;
    }
}
