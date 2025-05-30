struct ContactInfo {
    phone: String;
    email: String?;
}

struct Person {
    name: String;
    contact: ContactInfo;
}

contract NestedOptionalStrings {
    p: Person;

    init() {
        self.p = Person{
            name: "Charlie",
            contact: ContactInfo{
                phone: "123456",
                email: null,
            },
        };
    }
}