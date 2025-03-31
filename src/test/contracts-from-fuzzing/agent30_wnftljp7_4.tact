contract ParamContract(x: Int) {
    // No explicit init, using contract parameters only
}

contract TestParam {
    receive() {
       // Correct usage of initOf for a contract with parameters (implicit empty init)
       let init_state = initOf ParamContract(321);
       // Correct usage of codeOf for the same contract
       let code_cell = codeOf ParamContract;
    }
}
