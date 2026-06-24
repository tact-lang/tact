// test composite struct with primitives, nested structs, and optionals
struct AddressBook {
    owner: Address;
    nickname: String?;
    contact: Contact;
}

struct Contact {
    phone: String;
    email: String?;
    verified: Bool;
}

contract BookContract {
    book: AddressBook;
    init() {
        self.book = AddressBook {
            owner: myAddress(),
            nickname: null,
            contact: Contact {
                phone: "+123456789",
                email: null,
                verified: false
            }
        };
    }
}
