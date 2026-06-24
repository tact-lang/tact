struct UserProfile {
    name: String;
    age: Int;
    verified: Bool;
}

contract OptionalStructField {
    profile: UserProfile?;

    init() {
        self.profile = UserProfile{
            name: "Alice",
            age: 30,
            verified: true,
        };
    }
}