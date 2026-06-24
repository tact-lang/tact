struct HasAddress {
    addr: Address;
    note: String;
}

contract AddressContract {
    data: HasAddress;

    init() {
        self.data = HasAddress{
            addr: myAddress(),
            note: "address",
        };
    }
}