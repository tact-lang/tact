struct UserProfile {
    handle: String;
    level: Int as uint16;
}

contract OptionalStruct {
    profile: UserProfile?;

    init() {
        self.profile = null;
    }
}