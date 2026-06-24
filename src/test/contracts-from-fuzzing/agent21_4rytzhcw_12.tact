message(1234) Msg {
    x: Int;
}

contract MsgFieldTest {
    lastMsg: Msg;

    init() {
        self.lastMsg = Msg{ x: 42 };
    }
}
