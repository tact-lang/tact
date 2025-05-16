message(42) Msg42 {}

contract MsgOpcodeTest {
    m: Msg42;
    init() {
        self.m = Msg42{};
    }
}