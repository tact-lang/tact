message(0xDEADBEEF) EmptyMessage {}

contract Test {
    m: EmptyMessage;

    init() {
        self.m = EmptyMessage{};
    }
}