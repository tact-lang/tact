struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: InnerMost;
    c: Int?;
}

struct Outer {
    nested: Middle;
    d: Bool;
}

contract DeepNestTest {
    value: Outer;

    init() {
        self.value = Outer{
            nested: Middle{
                inner: InnerMost{ a: 10, b: false },
                c: null,
            },
            d: true
        };
    }
}
