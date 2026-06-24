contract ContractA {
    init() {
        // Mutual cross-contract initialization: ContractA calls initOf ContractB
        let s: StateInit = initOf ContractB();
    }
    receive() {}
}

contract ContractB {
    init() {
        // Mutual cross-contract initialization: ContractB calls initOf ContractA
        let s: StateInit = initOf ContractA();
    }
    receive() {}
}
