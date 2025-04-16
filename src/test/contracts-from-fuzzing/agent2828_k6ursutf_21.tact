message(42) Msg { f: Int; }

contract OptMsgField {
    mOpt: Msg?;

    init() {
        self.mOpt = null;
    }
}