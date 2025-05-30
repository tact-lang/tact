// test contract parameters with nested optional message
message(18) MsgOpt {
    y: Int;
}

struct OptMsgWrap {
    m: MsgOpt?;
}

contract ParamOptMsgWrap(
    wrap: OptMsgWrap?,
    number: Int
) {
    receive() {
        let _ = self.wrap;
        let _ = self.number;
    }
}
