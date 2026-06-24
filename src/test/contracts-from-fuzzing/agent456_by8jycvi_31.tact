struct PhoneBook {
    name: String;
    number: Int;
}

struct ContactCard {
    personal: PhoneBook;
    work: PhoneBook;
}

contract DoubleStruct {
    contact: ContactCard;

    init() {
        self.contact = ContactCard {
            personal: PhoneBook{ name: "John", number: 123 },
            work: PhoneBook{ name: "Jane", number: 456 }
        };
    }
}