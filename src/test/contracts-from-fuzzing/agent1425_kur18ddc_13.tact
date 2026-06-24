struct User {
    name: String;
    age: Int;
}

contract TestContract {
    count: Int;
    owner: Address?;
    user: User;

    init() {
        self.count = 0;
        self.owner = null;
        self.user = User{ name: "", age: 0 };
    }

    receive() {}
}