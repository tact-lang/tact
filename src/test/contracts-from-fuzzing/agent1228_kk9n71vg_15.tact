message(0x1) EmptyMsg {}

contract TestEmptyMessage {
    em: EmptyMsg;

    init() {
        self.em = EmptyMsg{};
    }
}