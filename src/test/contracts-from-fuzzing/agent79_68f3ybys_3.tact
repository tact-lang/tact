struct OptionalInner {
    x: Int;
}

struct OptionalOuter {
    inner: OptionalInner?;
}

contract TestContract {
    foo: OptionalOuter;

    init() {
        self.foo = OptionalOuter{
            inner: null
        };
    }
}