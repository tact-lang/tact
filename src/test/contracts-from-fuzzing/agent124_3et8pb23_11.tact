contract P(param: Int) {}

contract Q {
    receive() {
        // Valid usage of codeOf with a contract having parameters
        let c: Cell = codeOf P;
    }
}
