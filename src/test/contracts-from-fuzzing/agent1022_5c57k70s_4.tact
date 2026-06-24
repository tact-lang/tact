struct User {
    id: Int;
    name: String;
    nickname: String?; // optional field
}

contract TestContract {
    user: User;

    init() {
        self.user = User{
            id: 1,
            name: "Alice",
            nickname: null, // explicitly null
        };
    }

    receive() {}
}