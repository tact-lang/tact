struct UserData {
    id: Int?;
    name: String? = null;
    wallet: Address? = null;
}

contract UserProfile {
    meta: UserData?;
    profile: UserData?;

    init() {
        self.meta = null;
        self.profile = null;
    }
}