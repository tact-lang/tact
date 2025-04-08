message(0x11111111) OpMsg {
    value: Int;
}

contract MessageAsField {
    msgStruct: OpMsg;

    init() {
        self.msgStruct = OpMsg{ value: 999 };
    }
}