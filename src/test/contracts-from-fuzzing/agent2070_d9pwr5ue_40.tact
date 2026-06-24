struct StringAddressCombo {
    label: String;
    addr: Address;
}

contract StringAddressContract {
    combo: StringAddressCombo;

    init() {
        self.combo = StringAddressCombo{
            label: "Test address",
            addr: myAddress()
        };
    }
}