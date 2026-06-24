message(100) EmptyMessage {}

contract EmptyMessageField {
    data: EmptyMessage;
    init() {
        self.data = EmptyMessage{};
    }
}