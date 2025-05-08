struct UserProfile {
    name: String;
    age: Int?;
}

contract StructFieldTest {
    profile: UserProfile;

    init() {
        self.profile = UserProfile{ name: "Bob", age: 30 };
    }
}