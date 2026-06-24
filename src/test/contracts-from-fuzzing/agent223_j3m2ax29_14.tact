message(17) EmptyMsg {}

contract EmptyMsgAsField {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}