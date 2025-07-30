message(0x12345678) CustomOpcodeMsg {
    foo: Int;
}

contract MsgFieldOpcodeTest {
    msgData: CustomOpcodeMsg;
    init() {
        self.msgData = CustomOpcodeMsg{foo: 99};
    }
}