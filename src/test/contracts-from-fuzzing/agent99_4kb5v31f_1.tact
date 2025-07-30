struct InnerMost {
    a: Int;
}

struct Inner {
    b: InnerMost;
    c: Int;
}

struct Outer {
    d: Inner;
    e: Int;
}

contract NestedStructsTest {
    data: Outer;

    init() {
        self.data = Outer{
            d: Inner{
                b: InnerMost{ a: 1 },
                c: 2
            },
            e: 3
        };
    }
}