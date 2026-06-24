message(123) EmptyMsg {}

contract Test {
    saved: EmptyMsg;

    init() {
        self.saved = EmptyMsg{};
    }
}