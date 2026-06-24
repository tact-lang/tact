contract ParamContract(x: Int) {
    receive() {}
}

contract Test2 {
    receive() {
        // Valid usage: contract with parameters
        let st = initOf ParamContract(42);
        let cd = codeOf ParamContract;
    }
}
