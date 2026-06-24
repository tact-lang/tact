struct Profile {
    username: String;
    bio: String?;
}

contract OptionalStructStorage {
    profile: Profile?;

    init() {
        self.profile = null;
    }

    receive() {
    }
}
