struct AddressStructure {
    a: Address;
    b: Address?;
}

contract AddressField {
    s: AddressStructure;

    init() {
        self.s = AddressStructure{
            a: myAddress(),
            b: null
        };
    }
}