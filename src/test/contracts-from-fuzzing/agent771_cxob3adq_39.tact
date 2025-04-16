struct AddressBookEntry {
    name: String;
    phone: String?;
    email: String?;
}

contract AddressBook {
    entry: AddressBookEntry = AddressBookEntry {
        name: "Eve",
        phone: null,
        email: null
    };

    init() {
        self.entry = AddressBookEntry {
            name: "Eve Updated",
            phone: "123",
            email: "eve@mail.com"
        };
    }
}