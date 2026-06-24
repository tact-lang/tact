struct UserData {
    uid: Int;
    username: String;
}

contract OptStruct {
    user: UserData?;

    init() {
        self.user = null;
    }
}