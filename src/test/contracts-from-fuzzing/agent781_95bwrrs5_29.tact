message(0x42) EmptyMsg {}

contract TestContract {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}