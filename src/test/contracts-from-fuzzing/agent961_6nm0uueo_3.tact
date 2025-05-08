struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract DeepNestedStructContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner: Inner{ a: 5, b: false },
            flag: true
        };
    }
}