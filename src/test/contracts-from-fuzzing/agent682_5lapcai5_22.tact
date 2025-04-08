message EmptyMsg {}

contract TestContract {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}