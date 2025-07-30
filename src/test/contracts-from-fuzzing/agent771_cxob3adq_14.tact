struct Phone {
    number: String;
    verified: Bool?;
}

struct UserProfile {
    name: String;
    age: Int;
    phone: Phone;
    note: String?;
}

contract DeepOptionals {
    profile: UserProfile = UserProfile{
        name: "Emma",
        age: 25,
        phone: Phone{ number: "12345", verified: null },
        note: null
    };

    init() {
        self.profile = UserProfile{
            name: "Eva",
            age: 26,
            phone: Phone{ number: "67890", verified: true },
            note: "Active user"
        };
    }
}