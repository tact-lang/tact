struct AddrHolder {
    addr: Address;
}

contract StructAddr {
    s: AddrHolder;

    init() {
        self.s = AddrHolder{ addr: myAddress() };
    }
}