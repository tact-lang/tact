message(100) EmptyMsg {}

contract MsgEmptyField {
    msgData: EmptyMsg;

    init() {
        self.msgData = EmptyMsg{};
    }
}