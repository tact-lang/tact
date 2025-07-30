struct OptionalInner {
    level: Int?;
}

struct OptionalOuter {
    inner: OptionalInner?;
}

contract OptionalsTest {
    foo: OptionalOuter;
    init() {
        self.foo = OptionalOuter{ inner: null };
    }
    receive() {
        self.foo = OptionalOuter{ inner: OptionalInner{ level: 123 } };
    }
}