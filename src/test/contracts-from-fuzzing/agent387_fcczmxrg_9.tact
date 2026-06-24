struct Prof {
    name: String;
}

struct User {
    id: Int;
    prof: Prof?;
}

contract OptNestedImplicitNull {
    user: User;

    init() {
        self.user = User{
            id: 17
            // prof omitted; should be implicitly null
        };
    }
}