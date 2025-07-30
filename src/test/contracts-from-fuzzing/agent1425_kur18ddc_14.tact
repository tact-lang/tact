struct UserProfile {
    username: String?;
    bio: String?;
    email: String?;
    age: Int?;
    verified: Bool?;
}

contract UserContract {
    profile: UserProfile;

    init() {
        self.profile = UserProfile{
            username: null,
            bio: null,
            email: null,
            age: null,
            verified: null
        };
    }

    receive() {}
}