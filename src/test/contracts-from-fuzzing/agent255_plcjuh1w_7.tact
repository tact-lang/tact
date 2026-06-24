struct OptionalInner {
    flag: Bool;
}

struct WrappedOptionalInner {
    inner: OptionalInner?;
}

contract OptionalFieldWrapTest {
    w: WrappedOptionalInner;

    init() {
        self.w = WrappedOptionalInner{
            inner: null,
        };
    }
}