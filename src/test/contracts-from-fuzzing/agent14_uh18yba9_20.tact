message(0xAABBCCDD) EmptyMsg {}

struct WrapMsg {
    m: EmptyMsg;  // not optional
    x: Int;
}

contract HasEmptyMessageAsField {
    st: WrapMsg;

    init() {
        self.st = WrapMsg{
            m: EmptyMsg{},
            x: 5
        };
    }
}