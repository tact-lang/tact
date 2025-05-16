struct AddressLayer {
    aa: Address;
    ab: Address?;
}

contract AddressFields {
    d: AddressLayer;

    init() {
        self.d = AddressLayer{aa: myAddress(), ab: null};
    }
}