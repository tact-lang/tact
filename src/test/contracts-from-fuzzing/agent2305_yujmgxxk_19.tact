contract InheritanceNested(
    user: UserData
) {}

struct UserData {
    profile: Profile;
    balance: Int;
}

struct Profile {
    name: String;
    email: String;
    verified: Bool;
}
