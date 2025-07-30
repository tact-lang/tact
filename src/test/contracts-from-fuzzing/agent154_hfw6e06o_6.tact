struct OptionalNested {
    x: Int?;
    inner: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            x: null,
            inner: Inner{a: 12, b: false}
        };
    }
}