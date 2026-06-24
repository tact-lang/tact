struct OptionalMessage {
    f1: Int;
    f2: Bool?;
}

message(100) TestMsg {
    m1: Int;
    m2: OptionalMessage?;
}

contract TestMsgStorage {
    mymsg: TestMsg;

    init() {
        self.mymsg = TestMsg{
            m1: 5,
            m2: OptionalMessage{f1: 10, f2: null}
        };
    }
}