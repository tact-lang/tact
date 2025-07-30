struct UserProfile {
    name: String = "Unnamed";
    age: Int?;           // default is null
    email: String?;      // default is null
    isActive: Bool = true;
}

contract TestContract {
    profile: UserProfile;

    init() {
        self.profile = UserProfile{
            name: "Alice",
            age: 30,
            email: "alice@ton.org",
            isActive: true,
        };
    }

    receive() {
        let name = self.profile.name;
        let age = self.profile.age;
        let email = self.profile.email;
        let active = self.profile.isActive;
    }
}