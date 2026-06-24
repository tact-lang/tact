message(1234) Msg {
    a: Int;
    b: Int;
}

contract TestContract {
    m: Msg;
    init() {
        self.m = Msg{ a: 1, b: 2 };
    }
}