message(0x11111111) Msg {
    x: Int;
}

contract Test {
    m: Msg;

    init() {
        self.m = Msg{ x: 1 };
    }
}