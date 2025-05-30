message(0x77) MsgOptDefault {}

contract OptMsgDefault {
    data: MsgOptDefault? = null;

    init() {
        self.data = null;
    }
}