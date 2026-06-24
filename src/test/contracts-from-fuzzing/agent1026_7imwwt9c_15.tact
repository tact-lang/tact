struct Profile {
    username: String;
    active: Bool;
}

contract TestContract {
    profile: Profile;
    level: Int;
    nickname: String?;

    init() {
        self.profile = Profile{
            username: "anon",
            active: true
        };
        self.level = 1;
        self.nickname = null;
    }
}