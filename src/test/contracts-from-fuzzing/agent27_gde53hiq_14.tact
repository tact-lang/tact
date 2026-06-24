struct UserInfo {
    id: Int;
    active: Bool;
    nickname: String?;
}

contract UserContract(
    info: UserInfo,
    score: Int
) {}