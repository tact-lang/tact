struct UserData {
    nickname: String?;
}

contract TestContract {
    user: UserData?;

    init() {
        self.user = UserData{ nickname: null };
    }

    receive() {}
}