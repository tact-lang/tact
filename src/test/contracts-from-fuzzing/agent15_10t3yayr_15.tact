message(123) EmptyMsg {
}

contract MessageHolder {
    msgField: EmptyMsg;

    init() {
        self.msgField = EmptyMsg{};
    }
}