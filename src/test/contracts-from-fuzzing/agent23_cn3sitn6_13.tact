message EmptyMsg {}

contract EmptyMsgInState {
    msgData: EmptyMsg;

    init() {
        self.msgData = EmptyMsg{};
    }
}