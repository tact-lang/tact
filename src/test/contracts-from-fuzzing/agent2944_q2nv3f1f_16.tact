struct Name {
    first: String;
    last: String;
}

struct User {
    id: Int;
    name: Name;
    email: String?;
}

contract NestedDefaults {
    user: User;

    init() {
        self.user = User{
            id: 5,
            name: Name{
                first: "A",
                last: "B"
            },
            email: null
        };
    }
}