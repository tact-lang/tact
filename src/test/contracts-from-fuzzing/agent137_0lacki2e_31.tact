message(0x1) MsgEmpty {}

contract TestMsgEmpty {
    m: MsgEmpty;
    init() {
        self.m = MsgEmpty{};
    }
}