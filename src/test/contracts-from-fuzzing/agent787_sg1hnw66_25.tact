struct Profile {
    level: Int = 1;
    nickname: String = "anon";
    referral: Address?;
}

struct Player {
    id: Int;
    info: Profile;
}

contract TestContract {
    p: Player = Player{ id: 0, info: Profile{} };

    init() {
        self.p = Player{
            id: 123,
            info: Profile{ referral: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c") }
        };
    }
}