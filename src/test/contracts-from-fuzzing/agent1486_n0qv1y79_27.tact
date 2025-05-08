message(0xABCDEF) EMsg {}

struct WrapMsg {
    m: EMsg;
}

contract EmptyMsgInStruct {
    data: WrapMsg;

    init() {
        self.data = WrapMsg{
            m: EMsg{}
        };
    }
}