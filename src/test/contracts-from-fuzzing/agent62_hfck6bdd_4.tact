struct OptionalInner {
    maybeVal: Int?;
}

contract OptionalStructFieldTest {
    foo: OptionalInner;

    init() {
        self.foo = OptionalInner { maybeVal: null };
    }
}