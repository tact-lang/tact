struct Msg {
    text: String;
}

message NewMsg {
    body: Msg;
}

contract MsgContainer {
    val: NewMsg;

    init() {
        self.val = NewMsg{ body: Msg{ text: "abc" } };
    }
}