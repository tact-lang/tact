contract Test {
    receive() {
        // Test usage of initOf and codeOf expressions on current contract:

        // For a contract with no parameters, initOf must be invoked with empty parentheses.
        let init_val = initOf Test();
        
        // Extract code and data cells from the computed StateInit struct
        let init_code: Cell = init_val.code;
        let init_data: Cell = init_val.data;

        // Also get the code cell separately using codeOf expression
        let code_val: Cell = codeOf Test;

        // Dummy usage to force evaluation
        let _dummy1: Cell = init_code;
        let _dummy2: Cell = init_data;
        let _dummy3: Cell = code_val;
    }
}
