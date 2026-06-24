struct AddressS {
    a: Address;
    b: Address?;
}

contract TestAddress {
    data: AddressS;
    init() {
        self.data = AddressS{
            a: myAddress(),
            b: null,
        };
    }
}