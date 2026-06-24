message(77) EmptyMsg {}

contract TestContract {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}