contract ParamContract2 {
    init(x: Int) {
        // initialization logic with x
    }
    receive() {}
}

contract Test6 {
    receive() {
        let i = initOf ParamContract2(123);
        let c = codeOf ParamContract2;
    }
}
