struct UserProfile {
    name: String;
    nickname: String?;
    avatarHash: Int?;
}

contract ProfileWithOptionals {
    profile: UserProfile;

    init() {
        self.profile = UserProfile{
            name: "Alice",
            nickname: null,
            avatarHash: null,
        };
    }
}