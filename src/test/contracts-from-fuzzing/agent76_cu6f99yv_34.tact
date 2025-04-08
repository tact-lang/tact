message(1) EmptyMessage {}

contract AcceptsMessage {
    msgVal: EmptyMessage;
    init() {
        self.msgVal = EmptyMessage{};
    }
}