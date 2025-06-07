message(0x12345678) EmptyMsg {}

struct MsgWrap {
    m: EmptyMsg;
}

contract MsgAsStorage {
    mfield: MsgWrap;

    init() {
        self.mfield = MsgWrap{ m: EmptyMsg{} };
    }
}