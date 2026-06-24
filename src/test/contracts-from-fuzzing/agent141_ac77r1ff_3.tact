contract ParamContract(a: Int, b: Int) {
}

contract Test {
    receive() {
         let pkg = initOf ParamContract(10, 20);
         let code = codeOf ParamContract;
    }
}
