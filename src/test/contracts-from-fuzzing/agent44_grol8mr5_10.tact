message(1) EmptyMsg {}

contract EmptyMsgFieldContract {
    em: EmptyMsg;

    init() {
        self.em = EmptyMsg{};
    }
}