struct Profile {
    nickname: String;
}

message(0x123456) User {
    id: Int;
    pf: Profile;
}

contract TestContract {
    user: User;

    init() {
        self.user = User{
            id: 99,
            pf: Profile{ nickname: "zzz" },
        };
    }

    receive() {}
}