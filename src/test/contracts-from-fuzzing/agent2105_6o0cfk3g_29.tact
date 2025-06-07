struct AddressFields {
    a1: Address;
    a2: Address;
}

contract TestContract {
    s: AddressFields;

    init() {
        self.s = AddressFields{
            a1: myAddress(),
            a2: myAddress()
        };
    }
}