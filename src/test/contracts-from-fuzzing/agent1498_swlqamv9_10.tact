message(0x80) EmptyMsg {}

struct WrapMsg {
    m: EmptyMsg;
    n: Int;
}

contract EmptyMsgHolder {
    val: WrapMsg;

    init() {
        self.val = WrapMsg{
            m: EmptyMsg{},
            n: 5,
        };
    }
}