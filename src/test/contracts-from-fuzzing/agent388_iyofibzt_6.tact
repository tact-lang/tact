// nested optional inside struct field
struct OptionalInner {
    value: Int?;
}

struct OptionalOuter {
    inner: OptionalInner?;
}

contract NestedOptionalsTest {
    s: OptionalOuter = OptionalOuter{ inner: null };

    init() {
        self.s = OptionalOuter{ inner: OptionalInner{ value: 123 } };
    }
}