contract ContractC {
    init() {}
}

contract ContractB {
    receive() {
        let s = initOf ContractC();
    }
}

contract ContractA {
    receive() {
        let s1 = initOf ContractB();
        let s2 = initOf ContractC();
    }
}
