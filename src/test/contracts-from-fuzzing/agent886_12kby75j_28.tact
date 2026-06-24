message(0xABCD1234) Msg {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    m: Msg;

    init() {
        self.m = Msg{ foo: 111, bar: true };
    }
}