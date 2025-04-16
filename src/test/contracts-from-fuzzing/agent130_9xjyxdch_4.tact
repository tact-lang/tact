contract ParamContract(param: Int) {
    // Using contract parameters, no init() function
    receive() {}
}

contract Caller2 {
    receive() {
        // Valid usage: passing correct parameter
        let init_cell = initOf ParamContract(100);
        let code_cell = codeOf ParamContract;
    }
}
