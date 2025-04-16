message EmptyMsg {}

contract TestEmptyMsg {
    m: EmptyMsg;
    init() {
        self.m = EmptyMsg{};
    }
}