struct AllAddress {
    a: Address;
    b: Address?;
    c: Address;
    d: Address?;
}

contract AddressMix {
    f: AllAddress;

    init() {
        self.f = AllAddress{
            a: myAddress(),
            b: null,
            c: myAddress(),
            d: null
        };
    }
}