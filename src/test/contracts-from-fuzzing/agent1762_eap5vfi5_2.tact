struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    one: Inner;
    two: Inner;
    extra: Int;
}

contract DeepNest {
    data: Outer;
    init() {
        self.data = Outer{
            one: Inner{ a: 5, b: true },
            two: Inner{ a: 7, b: null },
            extra: 42
        };
    }
}