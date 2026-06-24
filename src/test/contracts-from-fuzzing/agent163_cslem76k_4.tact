contract ParamContract(param: Int) {
    receive() {}
}

contract TestInitParameterized {
    receive() {
         let s = initOf ParamContract(10);
    }
}
