struct NestedMsgWrap {
  innerMsg: EmptyMsg;
}

message(0x01) EmptyMsg {}

contract MsgStructStore {
    wrap: NestedMsgWrap = NestedMsgWrap{ innerMsg: EmptyMsg{} };

    init() {
        self.wrap = NestedMsgWrap{ innerMsg: EmptyMsg{} };
    }
}