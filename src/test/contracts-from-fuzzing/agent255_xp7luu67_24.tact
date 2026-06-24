message(42) EmptyMsg {}

contract TestContract {
    foo: EmptyMsg;
    
    init() {
        self.foo = EmptyMsg{};
    }
}