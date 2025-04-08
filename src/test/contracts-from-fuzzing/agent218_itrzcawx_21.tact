message(42) EmptyMsg {}

contract MsgAsField {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}