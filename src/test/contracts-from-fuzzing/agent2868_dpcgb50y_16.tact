struct ContainsAddress {
    addr: Address;
}

contract StructWithAddress {
    s: ContainsAddress;

    init() {
        self.s = ContainsAddress{ addr: myAddress() };
    }
}