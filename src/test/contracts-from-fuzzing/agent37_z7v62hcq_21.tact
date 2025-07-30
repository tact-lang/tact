struct AddressBook {
    name: String;
    addr: Address;
    nickname: String?;
    email: String?;
}

struct Holder {
    contact: AddressBook;
    active: Bool;
}

contract Test {
    person: Holder;
    init() {
        self.person = Holder{
            contact: AddressBook{
                name: "Alice",
                addr: myAddress(),
                nickname: null,
                email: null,
            },
            active: true,
        };
    }
}