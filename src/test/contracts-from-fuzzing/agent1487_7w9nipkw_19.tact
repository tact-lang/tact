message(0x100) EmptyMessage {}

contract EmptyMsgStorage {
    m: EmptyMessage;

    init() {
        self.m = EmptyMessage{};
    }
}