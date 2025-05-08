struct Inner { x: Int }

struct Outer {
    inner: Inner;
    maybeInner: Inner?;
}

contract NestedStructContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ x: 1 },
            maybeInner: null
        };
    }
}