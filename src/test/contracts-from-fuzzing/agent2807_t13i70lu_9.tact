message(1) Msg {
    foo: Int;
}

contract MessageAsField {
    val: Msg;
    init() {
        self.val = Msg{ foo: 99 };
    }
}