message(0x2222) EmptyMsg {}

contract TestContract {
    maybeEmpty: EmptyMsg? = null;
    init() {
        self.maybeEmpty = EmptyMsg{};
    }
}