message(0x01) EmptyMsg {}

contract EmptyMsgHolder {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}