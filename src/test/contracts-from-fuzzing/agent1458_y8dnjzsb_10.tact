message(123) MsgType {
    val: Int;
    ok: Bool;
}

contract Test {
    optMsg: MsgType?;

    init() {
        self.optMsg = null;
    }
}