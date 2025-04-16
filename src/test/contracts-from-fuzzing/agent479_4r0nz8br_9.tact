message(12345) MsgExample {
    data: Int as uint32;
    note: String;
}

contract MsgFieldTest {
    val: MsgExample;

    init() {
        self.val = MsgExample{data: 42, note: "hi"};
    }
}