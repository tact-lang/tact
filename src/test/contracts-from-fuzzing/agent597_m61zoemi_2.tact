struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    c: String;
    d: Bool?;
}

contract DeepNestedFields {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner: Inner{ a: 7, b: true },
            c: "Hello",
            d: false,
        };
    }
}