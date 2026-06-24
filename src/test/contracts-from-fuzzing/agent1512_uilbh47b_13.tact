struct Profile {
    nickname: String?;
    active: Bool?;
    score: Int = 0;
}

contract TestContract {
    user: Profile;

    init() {
        self.user = Profile{
            nickname: null,
            active: null,
            score: 77
        };
    }
}