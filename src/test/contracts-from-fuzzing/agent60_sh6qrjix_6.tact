contract TestParams(a: Int) {
    // No init() function allowed due to contract parameters syntax
    receive() {
        // Valid usage of codeOf for a contract with parameters
        let c: Cell = codeOf TestParams;
    }
}
