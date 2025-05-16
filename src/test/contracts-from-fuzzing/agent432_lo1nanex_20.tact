message(0x1234) Msg {
    data: Int;
}

contract MessageStorage {
    m: Msg;

    init() {
        self.m = Msg{
            data: 77,
        };
    }
}
