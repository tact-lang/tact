message(42) Msg { foo: Int; }

contract OptMsgNull {
    m: Msg?;
    init() {
        self.m = null;
    }
}