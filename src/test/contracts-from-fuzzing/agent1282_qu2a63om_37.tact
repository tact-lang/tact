// Nested struct with empty optionals initially set
struct User {
    name: String;
    email: String?;
}

struct Account {
    user: User?;
    active: Bool;
}

contract NestedEmptyNulls {
    state: Account;

    init() {
        self.state = Account{
            user: null,
            active: false,
        };
    }
}
