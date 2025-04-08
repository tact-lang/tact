struct Profile {
    user: String;
    score: Int;
}

contract OptionalNestedStruct {
    profile: Profile?;

    init() {
        self.profile = Profile{
            user: "Bob",
            score: 99,
        };
    }
}