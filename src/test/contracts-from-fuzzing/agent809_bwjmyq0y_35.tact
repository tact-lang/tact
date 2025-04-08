message(0x11111111) EmptyMsg {}

contract MsgFieldTest {
    m: EmptyMsg;

    init() {
        self.m = EmptyMsg{};
    }
}