message EMsg {}

struct HasMsg {
    m: EMsg;
}

contract MsgInStructPersist {
    val: HasMsg;
    init() {
        self.val = HasMsg{ m: EMsg{} };
    }
}