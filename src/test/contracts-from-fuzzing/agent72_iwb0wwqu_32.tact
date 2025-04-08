message(1234) EmptyMessage {}

contract OptionalEmptyMsgTest {
    opt: EmptyMessage?;

    init() {
        self.opt = EmptyMessage{};
    }
}