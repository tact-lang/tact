contract ContractB {
    init() {}
}

contract ContractA {
    receive() {
        let s = initOf ContractB();
        let addr = contractAddress(s);
    }
}