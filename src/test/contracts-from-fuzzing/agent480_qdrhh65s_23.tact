message(0x21) MyMsg {
    val: Int as uint32;
}

contract MsgWithSerInPersistent {
    msgval: MyMsg;

    init() {
        self.msgval = MyMsg{val: 12345};
    }
}