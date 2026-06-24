contract CP(a: Int, b: Int) {
    receive() {}
}

contract TestCPValid {
    receive() {
        // Valid: contract with parameters used with initOf and codeOf
        let init_cp = initOf CP(10, 20);
        let code_cp = codeOf CP;
    }
}
