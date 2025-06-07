contract SimpleB {
    init() {}
}

contract SimpleA {
    receive() {
        let s: StateInit = initOf SimpleB();
        let addr: Address = contractAddress(s);
    }
}