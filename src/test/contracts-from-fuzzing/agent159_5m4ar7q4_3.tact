contract ParamContract(a: Int) {
    receive() {}
}

contract Test1 {
    receive() {
        let initCell = initOf ParamContract(123);
        let codeCell = codeOf ParamContract;
    }
}
