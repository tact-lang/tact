// test optional message type persistent var
message(2) InnerMsgOpt {
    y: Int;
}

contract TestOptionalMsg {
    val: InnerMsgOpt? = null;

    init() {
        self.val = InnerMsgOpt{y: 50};
    }
}
