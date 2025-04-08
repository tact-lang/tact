struct User {
    id: Int;
    name: String;
}

contract TestContract {
    maybeUser: User?;

    init() {
        self.maybeUser = null;
    }
}