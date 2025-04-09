message(123) EmptyMsg {}

contract EmptyMsgField {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}