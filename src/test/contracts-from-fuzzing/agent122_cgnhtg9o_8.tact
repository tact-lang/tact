contract ParamContract(a: Int) {
    receive() {}
}

contract TestCodeOfParam {
    receive() {
         let cell = codeOf ParamContract;
    }
}
