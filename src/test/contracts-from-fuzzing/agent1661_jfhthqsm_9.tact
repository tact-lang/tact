struct Passport {
    number: String;
    expiry: Int;
}

struct Person {
    name: String;
    age: Int;
    passport: Passport?;
}

contract DeepOptional {
    p: Person = Person{
        name: "Tom",
        age: 30,
        passport: null
    };

    init() {
        self.p = Person{
            name: "Pam",
            age: 33,
            passport: Passport{
                number: "XYZ",
                expiry: 12345678
            }
        };
    }
}