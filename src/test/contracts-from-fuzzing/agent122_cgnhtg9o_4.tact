contract ParamContract(a: Int) {
    receive() {}
}

contract TestInitParam {
    receive() {
         let s = initOf ParamContract(10);
    }
}
