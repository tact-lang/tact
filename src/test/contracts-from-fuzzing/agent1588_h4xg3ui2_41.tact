message EmptyMsg {}

contract EmptyMsgContract {
    m: EmptyMsg;
    init() {
        self.m = EmptyMsg{};
    }
}