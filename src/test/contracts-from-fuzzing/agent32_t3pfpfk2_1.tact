contract ContractB {
    init(x: Int) {
        // Just initialize contract B with parameter x
    }
    receive() {}
}

contract ContractA {
    init() {
        // Using initOf for ContractB with parameter x = 42
        let s: StateInit = initOf ContractB(42);
    }
    receive() {}
}
