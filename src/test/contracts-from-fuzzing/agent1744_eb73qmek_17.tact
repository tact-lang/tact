// test message struct inside a contract storage
message(0x1111) MsgType {
    val: Int;
}

contract MessageStorage {
    field: MsgType;

    init() {
        self.field = MsgType{ val: 123 };
    }
}
