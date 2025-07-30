struct MsgInner {
    a: Int;
}
message(1) MsgOuter {
    m: MsgInner;
}

contract MsgHolder {
    m: MsgOuter;

    init() {
        self.m = MsgOuter{m: MsgInner{a: 42}};
    }
}