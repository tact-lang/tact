struct MsgSub {
    x: Int;
}

message TestMsg {
    m: MsgSub;
}

contract MsgInStorage {
    data: TestMsg;

    init() {
        self.data = TestMsg{
            m: MsgSub{ x: 42 },
        };
    }
}