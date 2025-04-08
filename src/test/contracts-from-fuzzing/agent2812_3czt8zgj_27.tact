struct MsgInner {
    val: Int;
}

message Msg1 {
    inner: MsgInner;
}

contract MessageField {
    msg: Msg1;

    init() {
        self.msg = Msg1{ inner: MsgInner{ val: 99 } };
    }
}