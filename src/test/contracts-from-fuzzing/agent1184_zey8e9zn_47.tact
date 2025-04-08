message(0x01) EmptyMsg {}

contract MsgField {
    msgField: EmptyMsg;

    init() {
        self.msgField = EmptyMsg{};
    }
}