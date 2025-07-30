message(1) EmptyMsg {}

contract Test9 {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}