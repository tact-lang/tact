message EmptyMsg {}

contract EmptyMsgStorage {
    foo: EmptyMsg;
    init() {
        self.foo = EmptyMsg{};
    }
    receive() {}
}