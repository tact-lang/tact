message(42) MsgData { val: Int; }

contract PersistentMessageField {
    m: MsgData;

    init() {
        self.m = MsgData{ val: 777 };
    }
}