message(0x55) TestMsg {
    val: Int;
}

struct MaybeMsg {
    m: TestMsg?;
    flag: Bool;
}

contract OptionalMessage {
    data: MaybeMsg;

    init() {
        self.data = MaybeMsg{
            m: null,
            flag: true,
        };
    }
}