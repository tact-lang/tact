message EmptyMsg{}

contract EmptyMessageField {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}