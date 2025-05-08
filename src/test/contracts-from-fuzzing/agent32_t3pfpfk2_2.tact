contract ContractC {
    init(x: Int) {}
    receive() {}
}

contract ContractB {
    init() {
        // Multi-level initialization: ContractB creates init package for ContractC
        let s: StateInit = initOf ContractC(100);
    }
    receive() {}
}

contract ContractA {
    init() {
        // Top-level contract initializing ContractB
        let s: StateInit = initOf ContractB();
    }
    receive() {}
}
