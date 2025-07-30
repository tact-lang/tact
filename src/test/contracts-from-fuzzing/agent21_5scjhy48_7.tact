contract ParamContract(a: Int) {
    receive() {}
}

contract TestParam {
    receive() {
        // Valid usage with a contract that only uses contract parameters
        let pkg = initOf ParamContract(42);
        let code = codeOf ParamContract;
    }
}
