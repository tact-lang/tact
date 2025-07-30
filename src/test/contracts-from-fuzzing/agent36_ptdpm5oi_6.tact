struct AddressBook {
    name: String;
    phone: String;
    age: Int;
    alive: Bool;
}

struct UserProfile {
    id: Int;
    contact: AddressBook;
}

contract NestedStructs {
    profile: UserProfile;     // persistent nested struct

    init() {
        self.profile = UserProfile{
            id: 1,
            contact: AddressBook{
                name: "bob",
                phone: "+123",
                age: 30,
                alive: true
            }
        };
    }

    receive() {
        let _ = self.profile;
    }
}