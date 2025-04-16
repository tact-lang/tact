struct InnerMost {
    x: Int;
}

struct Middle {
    foo: Bool;
    innerMost: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract Test {
    nested: Outer;
    init() {
        self.nested = Outer{
            mid: Middle{
                foo: true,
                innerMost: InnerMost{
                    x: 42
                }
            }
        };
    }
}