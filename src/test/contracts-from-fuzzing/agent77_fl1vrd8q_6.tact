contract ParamContract(x: Int, y: Int) {
    receive() {}
}

contract Test {
    receive() {
        let a = initOf ParamContract(1, 2);
        let b = codeOf ParamContract;
    }
}