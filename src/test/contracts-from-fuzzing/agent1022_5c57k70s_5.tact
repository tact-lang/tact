struct Profile {
    age: Int?;
    email: String?;
}

struct User {
    id: Int;
    name: String;
    profile: Profile;
}

contract TestContract {
    user: User;

    init() {
        self.user = User{
            id: 42,
            name: "Bob",
            profile: Profile{
                age: null,
                email: "bob@example.com",
            }
        };
    }

    receive() {}
}