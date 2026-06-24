struct MessageStruct1 {
    f1: Int;
}

message Msg1 {
    f2: Int;
}

contract StructMsgMix {
    s: MessageStruct1;
    init() {
        self.s = MessageStruct1{ f1: 1 };
    }
}