message(17) OptMsg {
    num: Int;
}

contract OptMsgVar {
    m: OptMsg? = null;

    init() {
        self.m = OptMsg{num:99};
    }
}