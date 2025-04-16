struct UserProfile {
    nickname: String?;
    email: String?;
    age: Int?;
}

contract OptionalFieldsStruct {
    profile: UserProfile;

    init() {
        self.profile = UserProfile{
            nickname: null,
            email: null,
            age: null,
        };
    }
}