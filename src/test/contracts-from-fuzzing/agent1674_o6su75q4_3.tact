struct UserProfile {
    name: String;
    email: String?;
    age: Int?;
    verified: Bool;
}

contract ProfileStore {
    profile: UserProfile;

    init() {
        self.profile = UserProfile{
            name: "Alice",
            email: null,
            age: null,
            verified: false,
        };
    }
}