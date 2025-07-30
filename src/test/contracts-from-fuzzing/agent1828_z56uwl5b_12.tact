struct Profile {
    username: String;
    bio: String?;
    email: String?;
}

contract TestContract(
    profile: Profile
) {}