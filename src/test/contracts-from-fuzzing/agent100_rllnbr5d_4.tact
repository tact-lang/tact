contract ParamContract(a: Int, b: Int) {
    receive() {}
}

contract TestParam {
    receive() {
        let st = initOf ParamContract(42, 100);
        let code = codeOf ParamContract;
    }
}
