struct AddressCombo {
    a1: Address;
    a2: Address?;
}

contract TestContract {
    data: AddressCombo;

    init() {
        self.data = AddressCombo{
            a1: myAddress(),
            a2: null
        };
    }
}
