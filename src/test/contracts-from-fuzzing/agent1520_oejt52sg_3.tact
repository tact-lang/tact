struct Person {
    name: String;
    age: Int as uint8;
    vip: Bool?;
    email: String?;
    phone: String?;
    bio: String?;
    twitter: String?;
    github: String?;
}

contract AddressBook {
    head: Person;

    init() {
        self.head = Person {
            name: "Anon",
            age: 30,
            vip: null,
            email: null,
            phone: null,
            bio: null,
            twitter: null,
            github: null,
        };
    }
}
