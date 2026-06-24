struct UserProfile {
    name: String?;
    active: Bool;
}

contract ProfileStore {
    profile: UserProfile;

    init() {
        self.profile = UserProfile{ name: null, active: false };
    }
}