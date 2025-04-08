message(0x01) EmptyMsg {}

contract EmptyMsgField {
    data: EmptyMsg;
    init() {
        self.data = EmptyMsg{};
    }
}