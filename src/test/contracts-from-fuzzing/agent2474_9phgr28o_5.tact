struct Details {
    name: String = "Default";
    active: Bool = true;
}

struct UserProfile {
    id: Int;
    info: Details;
}

contract NestedDefaultsContract {
    profile: UserProfile;

    init() {
        self.profile = UserProfile{
            id: 42,
            info: Details{},
        };
    }
}
