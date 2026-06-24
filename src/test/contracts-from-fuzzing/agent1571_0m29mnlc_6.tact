message(0x42) EmptyMsg {}

contract TestContract {
    optMsg: EmptyMsg? = null;

    init() {
        self.optMsg = EmptyMsg{};
    }
}