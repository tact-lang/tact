struct Profile {
    nickname: String;
}

contract OptStructField {
    profile: Profile?;

    init() {
        self.profile = Profile{ nickname: "Bob" };
    }
}