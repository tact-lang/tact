message(1) EmptyMsg {}

contract EmptyMsgField {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}
