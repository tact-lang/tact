message(1) EmptyMessage {}

contract EmptyMessageField {
    msg: EmptyMessage;

    init() {
        self.msg = EmptyMessage{};
    }
}