struct NestedOptionals {
    inner: OptionalInner;
}

struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract NestedOptionalsTest {
    s: NestedOptionals;

    init() {
        self.s = NestedOptionals{
            inner: OptionalInner{
                foo: null,
                bar: null,
            },
        };
    }
}