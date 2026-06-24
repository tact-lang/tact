struct Name {
    first: String;
    last: String;
}

struct Contact {
    email: String;
    phone: String?;
}

struct Person {
    name: Name;
    age: Int;
    contact: Contact;
    notes: String?;
}

contract CompositeStructTest {
    data: Person;

    init() {
        self.data = Person{
            name: Name { first: "Ada", last: "Lovelace" },
            age: 36,
            contact: Contact { email: "ada@lovers.com" },
        };
    }
}