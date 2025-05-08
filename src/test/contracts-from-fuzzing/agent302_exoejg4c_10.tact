message(1) Msg1 {
    x: Int;
    y: Bool;
}

struct WrapMsg {
    m: Msg1;
    label: String;
}

contract MsgInStructTest {
    data: WrapMsg;

    init() {
        self.data = WrapMsg{
            m: Msg1{ x: 7, y: true },
            label: "wrapped"
        };
    }
}