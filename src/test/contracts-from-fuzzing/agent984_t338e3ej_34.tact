struct HasAddr {
    addr: Address;
}

contract NestedAddr {
    h: HasAddr;

    init() {
        self.h = HasAddr{addr: myAddress()};
    }
}