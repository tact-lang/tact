message(1) EmptyMsg {}

contract EmptyMsgField {
    data: EmptyMsg;

    init() {
        self.data = EmptyMsg{};
    }
}