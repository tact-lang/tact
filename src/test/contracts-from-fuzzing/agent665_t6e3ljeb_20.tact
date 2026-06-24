message(0x77) EmptyMsg {}

contract TestEmptyMsg {
    data: EmptyMsg;

    init() {
        self.data = EmptyMsg{};
    }
}
