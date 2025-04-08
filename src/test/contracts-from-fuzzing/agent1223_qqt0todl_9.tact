message(0x1) EmptyMsg {}

contract MessagePersistent {
    state: EmptyMsg;

    init() {
        self.state = EmptyMsg{};
    }
}