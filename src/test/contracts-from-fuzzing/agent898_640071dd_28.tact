message(0x42) EmptyMsg {}

contract MsgInStorage {
    stored: EmptyMsg;

    init() {
        self.stored = EmptyMsg{};
    }
}
