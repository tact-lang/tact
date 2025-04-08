struct Inner {
    s: String;
}

struct Outer {
    inner: Inner?;
    value: Int;
}

contract OptionalNested {
    data: Outer;
    init() {
        self.data = Outer{
            inner: null,
            value: 42
        };
    }
}
