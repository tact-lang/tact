struct AddrHolder {
    addr: Address;
}

contract HasAddress {
    field: AddrHolder;

    init() {
        self.field = AddrHolder{ addr: myAddress() };
    }
}