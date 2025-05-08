message(0x1) MsgType {
    foo: Int;
}

contract MessageStorage {
    saved: MsgType = MsgType{ foo: 1 };
}