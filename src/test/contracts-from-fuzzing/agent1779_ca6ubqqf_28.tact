struct RecvMessage {
    op: Int as uint32;
}

message(0x1) MsgA {
    val: Int;
}

contract MessageInState {
    m: MsgA;
    init() {
        self.m = MsgA{val:42};
    }
}