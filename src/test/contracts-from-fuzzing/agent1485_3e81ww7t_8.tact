message(1234) MsgType {
    foo: Int;
    bar: Bool;
}

contract OptionalMsg {
    optMsg: MsgType?;

    init() {
        self.optMsg = null;
    }
}