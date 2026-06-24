struct SubProfile {
    alias: String?;
    active: Bool;
}

struct User {
    nickname: String;
    info: SubProfile?;
}

contract OptionalSubStruct {
    profile: User = User{
        nickname: "john",
        info: null
    };

    receive() {
        self.profile = self.profile;
    }
}