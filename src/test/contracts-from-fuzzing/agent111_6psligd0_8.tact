contract ParamContract(param: Int) {
    get fun getParam(): Int {
        return self.param;
    }
}

contract TesterParam {
    receive() {
        // Using initOf with a contract that has parameters
        let si = initOf ParamContract(123);
        let code_cell = codeOf ParamContract;
        // No further operations; we're just verifying that initOf and codeOf compile correctly
    }
}
