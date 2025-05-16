struct AddressOptional {
    a: Address?;
}

contract AddressOptionalContract {
    s: AddressOptional;

    init() {
        self.s = AddressOptional{a: null};
    }
}