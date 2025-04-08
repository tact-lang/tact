struct Profile {
    user: String;
    level: Int as uint8;
    email: String?;
}

contract UserProfile(
    profile: Profile,
    status: Bool
) { }