message(1) OnlyMsg {}

contract PureMsgField {
    data: OnlyMsg;

    init() {
        self.data = OnlyMsg{};
    }
}
