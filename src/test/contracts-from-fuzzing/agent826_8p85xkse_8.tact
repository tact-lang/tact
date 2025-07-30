struct Profile {
    age: Int;
    nickname: String;
}

contract TestContract {
    profile: Profile? = null;

    init() {
        self.profile = Profile{ age: 45, nickname: "NestedOpt" };
    }
}
