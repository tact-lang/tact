message(0x1234) Msg {
    foo: Int;
}

contract Test {
    m: Msg?;

    init() {
        self.m = null;
    }
}