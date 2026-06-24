struct SInner {
    foo: Int;
}

contract OptionalStructContract {
    opt: SInner?;

    init() {
        self.opt = SInner{ foo: 10 };
    }
}