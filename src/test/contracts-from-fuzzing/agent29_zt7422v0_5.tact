contract ParamContract {
    init(x: Int) {
        // simple init
    }
    receive() {}
}

contract Test2 {
    receive() {
        let s_init = initOf ParamContract(123,); // using trailing comma
        let s_code = codeOf ParamContract;
    }
}
