struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract Test {
    on: OptionalNested = OptionalNested{
        inner: null
    };

    init() {}
}