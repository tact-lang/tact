struct OptAddr {
    a: Address?;
    b: Address?;
}

contract TestOptAddr {
    addr: OptAddr;

    init() {
        self.addr = OptAddr{a: null, b: myAddress()};
    }
}