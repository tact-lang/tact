message(0x5A5A5A5A) EmptyMsg {}

contract TestContract {
    stored: EmptyMsg;

    init() {
        self.stored = EmptyMsg{};
    }
}