message(123) EmptyMsg {}

contract TestContract {
    foo: EmptyMsg;

    init() {
        self.foo = EmptyMsg{};
    }
}