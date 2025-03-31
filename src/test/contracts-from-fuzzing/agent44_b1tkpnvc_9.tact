/// Test Case: Valid usage of initOf and codeOf with a contract that has contract parameters
contract ParamContract(val: Int) {
    receive() {}
}

contract TestParamValid {
    receive() {
        let s: StateInit = initOf ParamContract(42);
        let c: Cell = codeOf ParamContract;
    }
}
