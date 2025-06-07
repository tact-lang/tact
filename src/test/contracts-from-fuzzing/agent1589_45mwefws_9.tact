struct Inner {
    flag: Bool;
    optInt: Int?;
    msg: TestMsg;
}

message(1) TestMsg {
    val: Int;
}

contract NestedStructWithMsg {
    data: Inner;

    init() {
        self.data = Inner{ flag:true, optInt:null, msg:TestMsg{val:0} };
    }
}