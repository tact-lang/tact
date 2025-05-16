message(7777) VoidMsg {}

contract TestContract {
    emptyMessage: VoidMsg;

    init() {
        self.emptyMessage = VoidMsg{};
    }
}