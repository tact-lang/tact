struct UserProfile {
    name: String;
    age: Int?;
    active: Bool;
}

contract TestContract {
    profile: UserProfile;

    init() {
        self.profile = UserProfile{ name: "Alice", age: null, active: true };
    }
}
