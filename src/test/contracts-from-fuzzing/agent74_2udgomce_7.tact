contract ParamContract(a: Int, b: Int) {
    receive() {}
}

contract TestParam {
    receive() {
         let s: StateInit = initOf ParamContract(3, 4);
         let c: Cell = codeOf ParamContract;
    }
}
