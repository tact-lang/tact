struct Profile {
    username: String;
    age: Int?;
}

contract User {
    profile: Profile;

    init() {
        self.profile = Profile{ username: "abc", age: null };
    }
}