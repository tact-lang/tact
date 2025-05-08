message(1) EmptyMsg {}

contract UsesEmptyMessage {
    data: EmptyMsg;

    init() {
        self.data = EmptyMsg{};
    }
}
