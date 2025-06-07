struct SInner {
    a: Int;
}

struct SWrap {
    inner: SInner?;
}

contract OptionalStructInsideOptional {
    holder: SWrap?;

    init() {
        self.holder = null;
    }
}
