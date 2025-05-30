message(1) EmptyMsg {}

contract Test {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}