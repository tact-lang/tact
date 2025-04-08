message(1) Msg {
    foo: Int;
}

struct Inner {
    msg: Msg;
}

contract TestContract {
    s: Inner = Inner{ msg: Msg{ foo: 5 } };

    init() {
        self.s = self.s;
    }
}