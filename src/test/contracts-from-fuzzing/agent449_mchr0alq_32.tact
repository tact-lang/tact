// Message struct in persistent state (should be supported)
message(0x12345678) MsgStruct {
    x: Int;
    y: Bool;
}

contract MessageInState {
    m: MsgStruct;

    init() {
        self.m = MsgStruct{ x: 12, y: true };
    }
}
