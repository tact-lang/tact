contract ParamContract(param: Int) {
    receive() {}
}

contract TestParamContract {
    receive() {
         let pkg = initOf ParamContract(42);
         let c = codeOf ParamContract;
    }
}
