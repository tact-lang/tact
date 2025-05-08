struct Phone {
    number: String;
}

struct User {
    name: String;
    phone: Phone?;
}

contract OptionalWithString {
    u: User;

    init() {
        self.u = User{
            name: "Alice",
            phone: null
        };
    }
}