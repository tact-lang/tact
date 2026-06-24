struct UserProfile {
    name: String;
    age: Int;
}

contract OptionalStructTopLevel {
    profile: UserProfile?; // nullable

    init() {
        self.profile = UserProfile{
            name: "Alice",
            age: 30,
        };
    }
}