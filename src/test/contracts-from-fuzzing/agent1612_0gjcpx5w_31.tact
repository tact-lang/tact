struct AddressVariants {
    addr: Address;
    optAddr: Address?;
}

contract AddressStorage {
    store: AddressVariants;

    init() {
        self.store = AddressVariants{
            addr: myAddress(),
            optAddr: null,
        };
    }
}
