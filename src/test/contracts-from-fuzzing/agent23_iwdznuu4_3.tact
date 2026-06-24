contract P(param: Int) {
    receive() {}
}

contract TestValidParam {
    receive() {
        let s = initOf P(42);
        let c = codeOf P;
    }
}
