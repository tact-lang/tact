message(0x42) MsgType { foo: Int; }

contract StoreMsg {
    msgData: MsgType;

    init() {
        self.msgData = MsgType{ foo: 123 };
    }
}