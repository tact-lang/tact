struct Inner {
    foo: Int?;
}
struct Outer {
    bar: Inner?;
}

contract OptionalNestedStructs {
    baz: Outer?;

    init() {
        self.baz = null;
    }
}