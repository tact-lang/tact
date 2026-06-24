struct OptionalNested {
    data: Int?;
    inner: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract NestedOptional {
    foo: OptionalNested = OptionalNested{data: null, inner: null};

    init() {
        self.foo = OptionalNested{
            data: 7,
            inner: Inner{a: 42, b: true}
        };
    }
}