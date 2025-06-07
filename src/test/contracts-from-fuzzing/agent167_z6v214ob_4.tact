contract A {
    // Minimal contract with no parameters
    receive() {}
}

contract TestValid {
    receive() {
        // Valid usage of initOf and codeOf expressions in a function
        let init_state: StateInit = initOf A();
        let code_cell: Cell = codeOf A;
    }
}
