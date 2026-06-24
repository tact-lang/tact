struct AddressSet {
    aa: Address;
    bb: Address;
    cc: Address?;
}

contract AddressPersist {
    addrs: AddressSet;

    init() {
        self.addrs = AddressSet{
            aa: myAddress(),
            bb: myAddress(),
            cc: null,
        };
    }
}