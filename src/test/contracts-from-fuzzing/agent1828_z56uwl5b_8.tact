struct AddressBook {
    nickname: String?;
    contact: Contact?;
}

struct Contact {
    phone: String?;
    email: String?;
}

contract TestContract {
    book: AddressBook;

    init() {
        self.book = AddressBook{
            nickname: "Bob",
            contact: Contact{
                phone: "12345",
                email: null
            }
        };
    }
}