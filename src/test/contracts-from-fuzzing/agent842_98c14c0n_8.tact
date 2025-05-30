struct AddressCombo {
    main: Address;
    alt: Address?;
    label: String;
    note: String?;
}

contract AddressStorage {
    data: AddressCombo;

    init() {
        self.data = AddressCombo{
            main: myAddress(),
            alt: null,
            label: "primary",
            note: null
        };
    }
}