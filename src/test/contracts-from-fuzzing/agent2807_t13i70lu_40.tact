message(5) EmptyMsg {}

contract MsgEmptyField {
    m: EmptyMsg;
    init() {
        self.m = EmptyMsg{};
    }
}