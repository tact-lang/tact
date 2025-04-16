struct AddressOpts {
    main: Address;
    backup: Address?;
    amount: Int?;
    flag: Bool?;
}

contract AddressTest {
    data: AddressOpts;

    init() {
        self.data = AddressOpts{
            main: myAddress(),
            backup: null,
            amount: null,
            flag: null
        };
    }
}