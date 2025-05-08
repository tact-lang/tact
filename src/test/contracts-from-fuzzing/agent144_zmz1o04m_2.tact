struct UserProfile {
    username: String;
    age: Int?;
    isActive: Bool;
    bio: String?;
}

contract UserStorage {
    profile: UserProfile;

    init() {
        self.profile = UserProfile{
            username: "",
            age: null,
            isActive: false,
            bio: null,
        };
    }
}