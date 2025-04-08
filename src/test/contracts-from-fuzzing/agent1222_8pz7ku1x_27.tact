message(0xdeadbeef) EmptyMsg {}

contract TestContract {
    data: EmptyMsg;

    init() {
        self.data = EmptyMsg{};
    }

    receive() {
        let _data = self.data;
    }
}