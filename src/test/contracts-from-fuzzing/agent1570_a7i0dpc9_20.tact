struct AddressOptional {
    addr: Address?;
}

contract TestContract {
    foo: AddressOptional;
    init() {
        self.foo = AddressOptional{ addr: null };
    }
}