struct User {
    id: Int;
    name: String;
}

contract TestContract {
    user: User?;

    init() {
        self.user = null;
    }

    receive() {}
}