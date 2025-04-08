message(0x12345678) EmptyMsg {}

contract TestContract {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }

    receive() {
        self.m = self.m;
    }
}
