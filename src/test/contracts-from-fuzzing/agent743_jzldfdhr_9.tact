struct User {
    name: String;
    email: String?;
    age: Int?;
}

struct Config {
    owner: Address;
    paused: Bool;
}

contract DoubleNested {
    user: User;
    conf: Config;

    init() {
        self.user = User{
            name: "Alice",
            email: null,
            age: null
        };
        self.conf = Config{
            owner: myAddress(),
            paused: false
        };
    }
}