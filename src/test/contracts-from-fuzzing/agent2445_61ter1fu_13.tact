struct User {
    name: String?;
    age: Int?;
}

contract C {
    user: User?;

    init() {
        self.user = null;
    }

    receive() {}
}