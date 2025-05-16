message(0x1111) EmptyMsg {}

contract PersistEmptyMsg {
    msgval: EmptyMsg;
    init() {
        self.msgval = EmptyMsg{};
    }
}