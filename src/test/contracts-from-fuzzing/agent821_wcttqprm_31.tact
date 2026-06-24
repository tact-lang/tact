// test contract parameter with nested message struct
message(8) MInner {
    x: Int;
}

struct MsgWrap {
    m: MInner;
}

contract TestParamWithMsg(
    mwrap: MsgWrap
) {
    receive() {
        let _ = self.mwrap;
    }
}
