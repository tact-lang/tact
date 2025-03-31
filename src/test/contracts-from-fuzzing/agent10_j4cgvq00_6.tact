contract P(param: Int) {}

contract Test {
    receive() {
        let s = initOf P(42);
        let c = codeOf P;
    }
}
