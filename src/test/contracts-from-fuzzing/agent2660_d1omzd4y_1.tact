struct InnerMost {
    a: Int;
}

struct Middle {
    x: Int;
    y: InnerMost;
}

struct Outer {
    p: Middle;
    q: Int;
}

contract DeepNestedStructTest {
    nestedField: Outer;

    init() {
        self.nestedField = Outer{
            p: Middle{
                x: 1,
                y: InnerMost{a: 2}
            },
            q: 3
        };
    }
}
