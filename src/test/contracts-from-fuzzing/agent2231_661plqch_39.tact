struct AddressComb {
    a: Address;
    b: Address?;
    c: Address;
}

contract AddressCombContract {
    foo: AddressComb;

    init() {
        self.foo = AddressComb{
            a: myAddress(),
            b: null,
            c: myAddress()
        };
    }
}