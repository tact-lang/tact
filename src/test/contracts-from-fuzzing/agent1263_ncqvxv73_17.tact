// contract parameters with various optional and nested fields
struct Profile {
    nickname: String?;
    score: Int;
}

contract Test(
    name: String,
    age: Int?,
    profile: Profile?,
    active: Bool
) {}