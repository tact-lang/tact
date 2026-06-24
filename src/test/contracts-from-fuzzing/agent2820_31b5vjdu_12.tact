struct User {
    name: String;
    age: Int;
}

struct Profile {
    user: User;
    active: Bool;
}

contract NestedStringTest {
    data: Profile;

    init() {
        self.data = Profile{
            user: User{name: "Alice", age: 30},
            active: true
        };
    }
}