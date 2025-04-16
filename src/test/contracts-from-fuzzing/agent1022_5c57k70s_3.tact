struct User {
    id: Int;
    name: String;
}

contract TestContract {
    user: User;

    init() {
        self.user = User{
            id: 1,
            name: "Alice",
        };
    }

    receive() {}
}