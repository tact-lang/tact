struct AddressMix {
    a: Address;
    b: Address?;
    c: Address;
    d: Address?;
}

contract OptionalAddresses {
    val: AddressMix;
    init() {
        self.val = AddressMix{
            a: myAddress(),
            b: null,
            c: myAddress(),
            d: null,
        };
    }
}