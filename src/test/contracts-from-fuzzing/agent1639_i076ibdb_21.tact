struct AddressMix {
    a: Address?;
    b: Address;
    c: Address?;
    d: Int?;
    e: Bool?;
    f: Int;
}

contract TestContract {
    data: AddressMix;

    init() {
        self.data = AddressMix{
            a: null,
            b: myAddress(),
            c: myAddress(),
            d: 123,
            e: null,
            f: 42
        };
    }
}