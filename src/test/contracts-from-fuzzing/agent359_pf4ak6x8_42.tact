message(0x99) MsgOpt {}

struct WrapOpt {
    inner: MsgOpt?;
}

contract OptMsgParam(
    val: WrapOpt
) {}