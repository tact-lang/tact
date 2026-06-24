struct User {
    id: Int;
    name: String;
}

contract TestContract {
    user: User = User{ id: 1, name: "Alice" };

    init() {
        self.user = User{ id: 2, name: "Bob" };
    }
}
