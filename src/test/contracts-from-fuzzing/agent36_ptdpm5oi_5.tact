struct UserInfo {
    age: Int;
    nickname: String;
}

contract OptStructField {
    info: UserInfo?;     // nullable struct field
    
    init() {
        self.info = UserInfo{ age: 33, nickname: "anon" };
    }

    receive() {
        let _ = self.info;
    }
}