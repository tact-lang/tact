message(0x42) MyMsg {
    x: Int;
    txt: String;
    done: Bool;
}

contract MsgFieldTest {
    messageData: MyMsg;

    init() {
        self.messageData = MyMsg{
            x: 7,
            txt: "msg",
            done: true,
        };
    }
}