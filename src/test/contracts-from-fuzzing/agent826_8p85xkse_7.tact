struct Profile {
    age: Int?;
    nickname: String = "none";
}

contract TestContract {
    profile: Profile = Profile{ age: null, nickname: "none" };

    init() {
        self.profile = Profile{ age: 99, nickname: "Fuzz" };
    }
}
