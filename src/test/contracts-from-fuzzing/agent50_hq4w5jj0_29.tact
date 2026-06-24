message UserInfo {
    username: String;
    id: Int;
}

contract Test {
    receive() {
        let info: UserInfo? = null;
    }
}