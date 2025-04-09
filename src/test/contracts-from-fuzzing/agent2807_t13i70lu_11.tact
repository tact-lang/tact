message(1) Msg {
    foo: Int;
}

contract OptMsgField {
    val: Msg?;
    init() {
        self.val = null;
    }
}