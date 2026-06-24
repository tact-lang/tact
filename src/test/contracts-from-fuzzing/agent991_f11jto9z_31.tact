message(123) EmptyMsg {}

contract StoreEmptyMsg {
    em: EmptyMsg;
    init() {
        self.em = EmptyMsg{};
    }
}