contract ContractB(param: Int) {
    receive() {}
}

contract TestParams {
    receive() {
        let s: StateInit = initOf ContractB(42);
        let code: Cell = codeOf ContractB;
    }
}
