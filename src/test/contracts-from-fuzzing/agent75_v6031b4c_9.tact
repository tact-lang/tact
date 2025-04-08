struct Prof {
    name: String?;
    email: String?;
}

struct User {
    id: Int = 0;
    profile: Prof?;
}

contract NestedOptionals {
    user: User = User{
        id: 123,
        profile: null
    };

    init() {
        self.user = User{
            id: 456,
            profile: Prof{ name: "John", email: null }
        };
    }
}