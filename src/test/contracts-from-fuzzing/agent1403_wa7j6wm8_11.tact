struct IntWrap {
    x: Int;
}

contract OptionalNested {
    opt_inner: IntWrap?;

    init() {
        self.opt_inner = IntWrap{ x: 5 };
    }
}