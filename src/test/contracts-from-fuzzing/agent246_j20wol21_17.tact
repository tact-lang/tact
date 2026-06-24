// reuse of struct types with optionals

struct UserData {
    name: String;
    email: String?;
    phone: String?;
}

contract ReuseOptionals {
    user1: UserData;
    user2: UserData;

    init() {
        self.user1 = UserData{
            name: "Alice",
            email: "alice@example.com",
            phone: null,
        };
        self.user2 = UserData{
            name: "Bob",
            email: null,
            phone: null,
        };
    }
}
