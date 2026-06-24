struct UserData {
    age: Int?;
    nickname: String?;
    isMember: Bool?;
    details: Details?;
}

struct Details {
    verified: Bool?;
    bio: String?;
}

contract TestContract {
    user: UserData = UserData{
        age: null,
        nickname: null,
        isMember: null,
        details: null
    };

    init() {
        self.user = UserData{
            age: 33,
            nickname: "bob",
            isMember: true,
            details: Details{ verified: true, bio: "hi" }
        };
    }

    receive() {}
}
