message(555) DefaultMsgOpt {
    val: Int? = null;
}

struct OuterWrap {
    inner: DefaultMsgOpt;
}

contract DefaultOptMsgField {
    field: OuterWrap = OuterWrap{ inner: DefaultMsgOpt{} };
}