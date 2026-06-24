message UserMsg {
    coins: Int;
}

struct UserInfo {
    name: String = "default";
    m: UserMsg = UserMsg{ coins: 100 };
}

contract UserStorage {
    info: UserInfo = UserInfo{};
}