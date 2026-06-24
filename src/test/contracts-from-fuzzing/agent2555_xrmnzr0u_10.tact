message(0x42) MyMsg {
    data: Int;
}

contract OptMessageTest {
    msgField: MyMsg?;

    init() {
        self.msgField = MyMsg{ data: 99 };
    }
}