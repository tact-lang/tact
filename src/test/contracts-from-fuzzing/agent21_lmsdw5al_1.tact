contract SimpleChild {
    init() {}
}

contract SimpleParent {
    receive() {
        let s = initOf SimpleChild();
        let addr = contractAddress(s);
    }
}
