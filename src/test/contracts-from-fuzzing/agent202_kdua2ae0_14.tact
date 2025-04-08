struct MessageStruct {
    val: Int;
}

message(0x12345678) TestMessage {
    ms: MessageStruct;
}

contract MessageStorage {
    msgVal: TestMessage;

    init() {
        self.msgVal = TestMessage{
            ms: MessageStruct{
                val: 9
            }
        };
    }
}