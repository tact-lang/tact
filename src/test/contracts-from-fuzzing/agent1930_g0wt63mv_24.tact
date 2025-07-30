struct ContainsAddress {
    addr: Address;
}

contract AddressInStruct {
    data: ContainsAddress;

    init() {
        self.data = ContainsAddress{ addr: myAddress() };
    }
}