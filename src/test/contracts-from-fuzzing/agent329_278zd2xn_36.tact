message EmptyMsg {}

contract TestContract {
    field: EmptyMsg;

    init() {
        self.field = EmptyMsg{};
    }
}