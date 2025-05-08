// test nested optional struct persistent storage
struct Profile {
    nickname: String;
    age: Int?;
}

struct User {
    profile: Profile?;
    active: Bool;
}

contract Test {
    user: User?;

    init() {
        self.user = null;
    }
}