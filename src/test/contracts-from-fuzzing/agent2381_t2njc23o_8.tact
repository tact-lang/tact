struct UserInfo {
    name: String = "anon";
    wallet: Address? = null;
}

contract TestContract {
    user: UserInfo = UserInfo{};

    init() {}
}