struct Profile {
    id: Int;
    isAdmin: Bool;
    name: String?;
    email: String?;
}

contract OptProfile {
    user: Profile?;

    init() {
        self.user = null;
    }
}