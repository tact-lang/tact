message(0xABCDDCBA) EmptyMsg {}

contract EmptyMessageState {
    ref: EmptyMsg;

    init() {
        self.ref = EmptyMsg{};
    }
}