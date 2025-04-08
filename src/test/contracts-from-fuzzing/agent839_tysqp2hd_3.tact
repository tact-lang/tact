struct UserProfile {
    name: String;
    age: Int;
}

contract OptionalStruct {
    profile: UserProfile?;

    init() {
        self.profile = null;
    }
}