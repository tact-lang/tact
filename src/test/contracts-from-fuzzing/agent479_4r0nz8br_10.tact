message(42) Msg {
    foo: Int;
}

contract OptMsgFieldTest {
    optMsg: Msg?;

    init() {
        self.optMsg = Msg{foo: 1};
    }
}