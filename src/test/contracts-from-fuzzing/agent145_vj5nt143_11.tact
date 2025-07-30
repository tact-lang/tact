struct HasAddress {
    addr: Address;
    label: String;
}

contract AddressStore {
    data: HasAddress;

    init() {
        self.data = HasAddress{
            addr: myAddress(),
            label: "me",
        };
    }
}
