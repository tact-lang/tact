message(0x01) EmptyMsg {}

contract OptionalEmptyMsgField {
    data: EmptyMsg?;
    init() {
        self.data = EmptyMsg{};
    }
}