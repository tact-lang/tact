struct User {
    name: String;
    age: Int?;
    active: Bool;
}

contract OptionalStructFieldsFixed {
    user: User;

    init() {
        self.user = User{
            name: "Alice",
            age: null,
            active: true
        };
    }

    receive() {
        if (self.user.age != null) {
            let ageVal = self.user.age!! + 1;
            self.user.age = ageVal;
        } else {
            self.user.age = 30;
        }
        self.user.active = !self.user.active;
    }
}