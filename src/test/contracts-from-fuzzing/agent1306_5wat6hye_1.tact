struct AddressBookEntry {
    name: String;
    phoneNumber: String;
    email: String?;
    telegramHandle: String?;
}

contract TestContactStorage {
    contacts: AddressBookEntry;

    init() {
        self.contacts = AddressBookEntry{
            name: "Alice",
            phoneNumber: "+1234567890",
            email: null,
            telegramHandle: "@alice"
        };
    }
}