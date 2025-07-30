contract ParamContract(a: Int, b: Int) {}

contract TestParam {
    receive() {
         let s = initOf ParamContract(10, 20);
         let c = codeOf ParamContract;
    }
}
