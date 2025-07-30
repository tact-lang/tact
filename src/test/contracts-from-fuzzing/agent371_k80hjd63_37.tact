struct AddressCombo {
    a: Address;
    optAddr: Address?;
}
contract TestContract {
    data: AddressCombo;
    init() {
        self.data = AddressCombo{
            a: myAddress(),
            optAddr: null
        };
    }
}
