message EmptyMsg {}

contract EmptyMsgField {
    m: EmptyMsg;
    init() {
        self.m = EmptyMsg{};
    }
}