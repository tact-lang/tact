contract G {
    receive() {
        // Compare codeOf for current contract with myCode() function
        let code_a = codeOf G;
        let code_b = myCode();
        let _cmp = code_a == code_b;
    }
}
