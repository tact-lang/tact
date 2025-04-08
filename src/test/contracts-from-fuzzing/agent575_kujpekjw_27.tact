struct UserProfile {
    name: String?;
    active: Bool;
}

contract ParamOptional(
    profile: UserProfile?,
) {
    // No init()
}