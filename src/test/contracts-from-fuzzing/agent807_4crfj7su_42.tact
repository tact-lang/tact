// test nested message as contract field
message(1) MsgA {
    x: Int;
    y: Bool?;
}

contract MessageFieldTest {
    payload: MsgA;
    init() {
        self.payload = MsgA{ x: 5, y: null };
    }
}