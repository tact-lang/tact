contract ParamContract(a: Int, b: Int) {
    // Implicit empty init exists
}

contract TestParam {
    receive() {
        // Valid usage: using initOf on a contract with parameters
        let s: StateInit = initOf ParamContract(10, 20);
        let c = codeOf ParamContract;
    }
}
