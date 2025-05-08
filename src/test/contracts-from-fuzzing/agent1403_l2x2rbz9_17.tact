struct HasAddr {
    a: Address;
}

contract AddrField {
    f: HasAddr;

    init() {
        self.f = HasAddr{ a: myAddress() };
    }
}