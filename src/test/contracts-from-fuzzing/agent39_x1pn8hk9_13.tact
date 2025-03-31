contract ExprParams {
    init(param: Int) {}
}

contract ExprCaller {
    receive() {
        let s = initOf ExprParams(1+2);
        let addr = contractAddress(s);
    }
}
