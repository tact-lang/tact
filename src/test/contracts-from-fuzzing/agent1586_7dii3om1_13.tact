struct Contact {
    phone: String?;
    telegram: String?;
}

struct User {
    id: Int;
    name: String;
    active: Bool;
    balance: Int?;
    contact: Contact;
}

contract TestContract {
    user: User;

    init() {
        self.user = User{
            id: 42,
            name: "Eve",
            active: true,
            balance: null,
            contact: Contact{
                phone: null,
                telegram: "@eve_bot"
            }
        };
    }

    receive() {}
}