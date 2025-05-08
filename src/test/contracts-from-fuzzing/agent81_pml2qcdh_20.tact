message(1) Empty {}

contract MsgFieldTest {
    m: Empty;

    init() {
        self.m = Empty{};
    }
}