struct Wrapper {
    inner: UserInfo;
}

message UserInfo {
    username: String;
    id: Int;
}

contract Test {
    receive() {
        // No usage needed
    }
}