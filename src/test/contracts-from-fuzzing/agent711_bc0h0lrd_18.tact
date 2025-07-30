message(1001) EmptyMsg {}

contract EmptyMessageField {
    msg: EmptyMsg;

    init() {
        self.msg = EmptyMsg{};
    }
}
