struct UserProfile {
    nickname: String?;
    age: Int?;
    email: String?;
}

contract ParamWithOptStruct(
    profile: UserProfile
) {}