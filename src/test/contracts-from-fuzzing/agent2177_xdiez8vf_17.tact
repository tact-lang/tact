message(1234) EmptyMsg {}

struct WrapMsg {
    m: EmptyMsg;
}

contract ContractWithWrappedMsg {
    data: WrapMsg;

    init() {
        self.data = WrapMsg{m: EmptyMsg{}};
    }
}