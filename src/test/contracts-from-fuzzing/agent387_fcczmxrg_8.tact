struct Prof {
    name: String;
}

struct User {
    id: Int;
    prof: Prof?;
}

contract OptionalNestedUninit {
    user: User;

    init() {
        self.user = User{
            id: 5,
            prof: null
        };
    }
}