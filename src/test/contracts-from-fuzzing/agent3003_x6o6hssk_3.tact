struct Inner {
    foo: Int;
}

struct Outer {
    inner: Inner;
}

contract DeepNestedStructField {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ foo: 42 }
        };
    }
}
