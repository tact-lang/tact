message(0x11111111) Msg {
    a: Int;
    b: Bool;
}

contract TestContract {
    m: Msg;

    init() {
        self.m = Msg{
            a: 5,
            b: true
        };
    }
}