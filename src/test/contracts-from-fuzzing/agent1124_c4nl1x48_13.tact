message(0x42) MsgType { foo: Int; }

contract StoreOptionalMsg {
    maybeMsg: MsgType?;

    init() {
        self.maybeMsg = null;
    }
}