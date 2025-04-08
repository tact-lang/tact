struct Profile {
    nickname: String?;
    age: Int?;
}

contract TestContract {
    profile: Profile?;

    init() {
        self.profile = null;
    }
}