struct MultipleAddress {
    a1: Address;
    a2: Address?;
    a3: Address;
    a4: Address?;
}

contract AddressHolder {
    addresses: MultipleAddress;

    init() {
        self.addresses = MultipleAddress{
            a1: myAddress(),
            a2: null,
            a3: myAddress(),
            a4: null
        };
    }
}
