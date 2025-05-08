message(42) MsgContainer {
    val: Int as uint32;
    note: String;
}

contract OptionalMessageStorage {
    savedMsg: MsgContainer?;

    init() {
        self.savedMsg = MsgContainer{val: 123, note: "note"};
    }
}