struct AddressChain {
    a: Address;
    b: Address?;
    c: Address;
    d: Address?;
    e: Address;
}

contract AddressChainStorage {
    field: AddressChain;

    init() {
        self.field = AddressChain{
            a: myAddress(),
            b: null,
            c: myAddress(),
            d: null,
            e: myAddress()
        };
    }
}
