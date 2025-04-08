// Test contract with contract field containing struct with nested struct with options

struct Profile {
    user: UserInfo;
    details: UserDetails?;
}

struct UserInfo {
    id: Int;
    nickname: String?;
}

struct UserDetails {
    email: String?;
    verified: Bool;
}

contract ProfileContract {
    stored: Profile;

    init() {
        self.stored = Profile{
            user: UserInfo{ id: 100, nickname: null },
            details: null,
        };
    }
}
