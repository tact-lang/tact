struct Profile {
    username: String;
    age: Int?;
}

contract OptionalStructTest {
    user: Profile?;

    init() {
        self.user = null;
    }

    receive() {}
}