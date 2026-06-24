struct User {
    name: String;
    age: Int?;
}

contract ComplexStorage {
    users: map<Int, User>;
    optionalFlag: Bool?;

    init() {
        self.users = emptyMap();
        self.optionalFlag = null;
    }

    receive() {
        // Will not dump complex things to avoid prior issue
    }
}
