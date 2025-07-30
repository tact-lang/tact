struct Profile {
    nickname: String;
}

struct User {
    id: Int;
    profile: Profile?;
}

contract OptNestedStruct {
    user: User;

    init() {
        self.user = User{
            id: 123,
            profile: null
        };
    }
}