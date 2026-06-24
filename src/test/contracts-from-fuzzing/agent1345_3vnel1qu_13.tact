// optional struct field with nested optional fields inside
struct AddressBook {
    contact: Contact?;
}

struct Contact {
    name: String?;
    phone: String?;
}

contract Test {
    abook: AddressBook?;

    init() {
        self.abook = AddressBook{ contact: null };
    }
}