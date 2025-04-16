struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: null
        };
    }
}