message(0x22) EmptyMsg {}

contract MsgPersist {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}
