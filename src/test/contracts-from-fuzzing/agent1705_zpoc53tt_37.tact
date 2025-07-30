message EmptyMsg {}

contract MsgField {
    f: EmptyMsg;

    init() {
        self.f = EmptyMsg{};
    }
}