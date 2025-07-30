message(0x28828282) MsgA {
    a: Int;
    b: String;
}

message(0x39939393) MsgB {
    nested: MsgA;
    comment: String;
}

contract ContractWithMessageFields {
    field1: MsgA;
    field2: MsgB;

    init() {
        self.field1 = MsgA { a: 10, b: "test" };
        self.field2 = MsgB { nested: self.field1, comment: "nested" };
    }
}
