message(1) EmptyMessage {}

contract EmptyMsgContract {
    msgfield: EmptyMessage;

    init() {
        self.msgfield = EmptyMessage{};
    }
}