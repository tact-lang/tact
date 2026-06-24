message(0x11) TinyMsg {}

struct MsgHolder {
    m: TinyMsg?;
}

contract NullMsgStruct {
    content: MsgHolder?;

    init() {
        self.content = null;
    }
}