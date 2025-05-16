struct Profile {
    nickname: String? = null;
    bio: String? = "Hello!";
    age: Int? = null;
}

contract DefaultsNestedOpt {
    profile: Profile;

    init() {
        self.profile = Profile{};
    }
}