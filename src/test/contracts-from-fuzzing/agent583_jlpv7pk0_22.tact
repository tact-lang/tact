message(7) EmptyMsg {}

contract OptEmptyMsg {
    foo: EmptyMsg?;

    init() {
        self.foo = EmptyMsg{};
    }
}