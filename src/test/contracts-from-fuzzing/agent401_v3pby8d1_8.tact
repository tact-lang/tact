struct Details {
    age: Int?;
    address: String?;
}

struct User {
    name: String;
    details: Details?;
}

contract Test {
    user: User;

    init() {
        self.user = User{
            name: "Eve",
            details: Details{
                age: null,
                address: "Earth"
            }
        };
    }
}
