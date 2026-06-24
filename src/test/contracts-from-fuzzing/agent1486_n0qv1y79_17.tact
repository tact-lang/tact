message(0x55555555) EmptyMsg {}

struct WrapEmpty {
    m: EmptyMsg;
}

contract EmptyMsgContract {
    payload: WrapEmpty;

    init() {
        self.payload = WrapEmpty{
            m: EmptyMsg{}
        };
    }
}