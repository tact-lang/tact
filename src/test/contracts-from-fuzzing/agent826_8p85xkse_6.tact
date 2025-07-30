struct Profile {
    age: Int? = null;
    nickname: String = "";
}

contract TestContract {
    profile: Profile = Profile{ age: null, nickname: "" };

    init() {
        self.profile = Profile{ age: 25, nickname: "Tester" };
    }
}
