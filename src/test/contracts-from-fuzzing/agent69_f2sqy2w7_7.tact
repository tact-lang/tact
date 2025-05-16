contract ParamContract(a: Int, b: Int) {}

contract TestParam {
    receive() {
        let c: Cell = codeOf ParamContract;
        let s: StateInit = initOf ParamContract(10, 20);
    }
}
