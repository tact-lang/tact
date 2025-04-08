message EmptyMsg {}

contract EmptyMsgField {
    emsg: EmptyMsg;
    init() {
        self.emsg = EmptyMsg{};
    }
}