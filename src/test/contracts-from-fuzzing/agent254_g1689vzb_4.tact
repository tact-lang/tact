struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    x: InnerMost;
    y: InnerMost?;
}

struct Outer {
    left: Middle;
    right: Middle?;
}

contract NestedOptionalContract {
    field: Outer;

    init() {
        self.field = Outer{
            left: Middle{
                x: InnerMost{a: 1, b: true},
                y: null
            },
            right: null
        };
    }
}