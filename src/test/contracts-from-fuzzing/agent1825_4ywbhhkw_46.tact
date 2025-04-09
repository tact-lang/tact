struct HasAddress {
    addr: Address;
}

contract ContractAddr {
    data: HasAddress;
    init() {
        self.data = HasAddress{addr:myAddress()};
    }
}
