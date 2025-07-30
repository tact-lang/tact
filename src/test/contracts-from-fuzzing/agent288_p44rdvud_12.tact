message(0x7777) EmptyMsg {}

contract StoreEmptyMsg {
    saved: EmptyMsg = EmptyMsg{};

    init() {
        self.saved = EmptyMsg{};
    }
}