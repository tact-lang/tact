message(44) EmptyMsg {}

contract HasEmptyMsgField {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}