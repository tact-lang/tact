struct UserInfo {
    id: Int;
    name: String;
    verified: Bool;
    bio: String?;
    score: Int?;
}

contract TestContract {
    user1: UserInfo;

    init() {
        self.user1 = UserInfo{
            id: 7,
            name: "Satoshi",
            verified: false,
            bio: null,
            score: null
        };
    }
}