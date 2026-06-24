// Empty message but nested in a struct (allowed)
message(1) EmptyMsg {}

struct WrapMsg {
    m: EmptyMsg;
}

contract WrapMsgContract {
    data: WrapMsg;

    init() {
        self.data = WrapMsg{
            m: EmptyMsg{},
        };
    }
}