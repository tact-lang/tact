struct WrapInt {
    v: Int;
}

contract OptionalWrap {
    s: WrapInt?;

    init() {
        self.s = null;
    }
}