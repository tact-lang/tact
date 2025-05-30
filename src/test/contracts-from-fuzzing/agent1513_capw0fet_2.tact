struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract NestedStructContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner1: Inner{ a: 5, b: null },
            inner2: Inner{ a: 10, b: 20 }
        };
    }
}