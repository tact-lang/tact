struct ContainsMsg {
    flag: Bool;
    payload: Message;
}

message(404) Message {
    content: String;
}

contract StructWithMessageField {
    data: ContainsMsg;
    init() {
        self.data = ContainsMsg{ flag: true, payload: Message{ content: "err" } };
    }
}
