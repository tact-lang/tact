contract ParamContract(x: Int) {
    // Using contract parameters (no init function declared)
    receive() {}
}

contract Main {
    receive() {
        // Test initOf with contract parameters
        let init_state = initOf ParamContract(10);
        // Test codeOf with contract parameters
        let code_cell = codeOf ParamContract;
    }
}
