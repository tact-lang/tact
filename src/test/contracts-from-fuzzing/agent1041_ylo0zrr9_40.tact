message(1) EmptyMessage {}

contract MsgAsField {
    emptyMsg: EmptyMessage;

    init() {
        self.emptyMsg = EmptyMessage{};
    }
}
