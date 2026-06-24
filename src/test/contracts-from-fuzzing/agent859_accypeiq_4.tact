struct OptionalNestedInner {
    x: Int?;
    y: Bool?;
}

struct OptionalNestedOuter {
    inner: OptionalNestedInner?;
    flag: Bool;
}

contract OptionalNestedStructTest {
    field: OptionalNestedOuter;

    init() {
        self.field = OptionalNestedOuter{
            inner: OptionalNestedInner{
                x: null,
                y: true
            },
            flag: false
        };
    }
}
