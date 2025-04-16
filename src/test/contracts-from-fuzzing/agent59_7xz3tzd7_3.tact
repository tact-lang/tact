contract A {
    receive() {}
}

contract TestValidUsage {
    receive() {
        // valid use of initOf and codeOf inside function scope
        let init_state = initOf A();
        let code_cell = codeOf A;
        
        // use init_state and code_cell to prevent unused variable warnings
        if (code_cell != init_state.code) {
            // dummy branch
            return;
        }
    }
}
