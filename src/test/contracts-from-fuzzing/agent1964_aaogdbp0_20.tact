struct Inner {
    foo: Int;
}

struct Outer {
    inner: Inner?;
    bar: Int?
}

contract OptionalNestedStructField {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            bar: null
        };
    }
}