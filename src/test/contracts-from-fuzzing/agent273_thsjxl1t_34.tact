message(0x41) EmptyMsg {}

contract MsgAsField {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}