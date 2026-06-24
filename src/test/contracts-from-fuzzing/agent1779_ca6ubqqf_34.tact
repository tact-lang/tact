message(0x1234) EmptyMsg {}

contract EmptyMsgField {
    data: EmptyMsg;
    init() {
        self.data = EmptyMsg{};
    }
}