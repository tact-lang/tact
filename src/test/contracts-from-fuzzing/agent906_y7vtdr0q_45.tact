struct HasAddress {
    addr: Address;
}

contract AddressState {
    field: HasAddress;

    init() {
        self.field = HasAddress{
            addr: myAddress(),
        };
    }
}