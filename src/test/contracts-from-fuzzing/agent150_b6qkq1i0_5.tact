contract ParamContract(param: Int) {
    receive() {}
}

contract TestParam {
    receive() {
         let init_cell = initOf ParamContract(123);
         let code_cell = codeOf ParamContract;
    }
}
