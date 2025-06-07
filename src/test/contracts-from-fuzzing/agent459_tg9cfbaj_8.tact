message(42) MsgData {
    field1: Int;
    field2: Bool;
}

contract PersistentMessageField {
    msgStore: MsgData = MsgData{ field1: 7, field2: true };

    init() {
        self.msgStore = MsgData{ field1: 100, field2: false };
    }
}