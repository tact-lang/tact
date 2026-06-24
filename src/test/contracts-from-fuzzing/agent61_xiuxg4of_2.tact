contract ContractA {
    receive() {}
}

contract Test1 {
    receive() {
        let state: StateInit = initOf ContractA();
        let code: Cell = codeOf ContractA;
    }
}
