// test nested message with nested struct inside message inside contract var
struct InnerS {
    foo: Int?;
}

message(2) OuterMsg {
    nested: InnerS;
}

contract MsgWithStructField {
    m: OuterMsg;
    init() {
        self.m = OuterMsg{ nested: InnerS{ foo: null } };
    }
}