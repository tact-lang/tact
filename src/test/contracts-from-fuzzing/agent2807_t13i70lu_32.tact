message(1) InnerM {
    foo: Int;
}

message(2) OuterM {
    m: InnerM;
    bar: Int;
}

contract PersistMsgInMsg {
    val: OuterM;
    init() {
        self.val = OuterM{ m: InnerM{ foo: 10 }, bar: 20 };
    }
}