message(0x99999999) OptMsg {
    val: Int;
}

contract OptionalMsgState {
    m: OptMsg?;
    init() {
        self.m = null;
    }
}