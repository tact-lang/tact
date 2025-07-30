message(10) InnerMsg {
    val: Int;
}

struct MessageHolder {
    innerRequired: InnerMsg;
    innerOptional: InnerMsg?;
}

contract MsgInsideStructStorage {
    state: MessageHolder;

    init() {
        self.state = MessageHolder{
            innerRequired: InnerMsg{ val: 1 },
            innerOptional: null,
        };
    }
}