message(10) MsgA { foo: Int }
message(20) MsgB { bar: Bool }
message(30) MsgC { baz: String }

contract Test19 {
    ma: MsgA;
    mb: MsgB;
    mc: MsgC;

    init() {
        self.ma = MsgA{foo:1};
        self.mb = MsgB{bar:true};
        self.mc = MsgC{baz:"hi"};
    }
}
