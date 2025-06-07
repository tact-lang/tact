message(42) OnlyOp {}

struct WrapMsg {
    inner: OnlyOp;
}

contract MsgInStruct {
    field: WrapMsg;

    init() {
        self.field = WrapMsg{ inner: OnlyOp{} };
    }
}