struct Inner {
    a: Int;
}

contract OptionalNestedInner {
    opt: Inner?;
    init() {
        self.opt = Inner{ a: 10 };
    }
}