struct OptionalNested {
    maybeInner: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestOptionalNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            maybeInner: null
        };
    }
}
