message EmptyMsg {}

contract EmptyMsgPersist {
    field: EmptyMsg;

    init() {
        self.field = EmptyMsg{};
    }
}