struct InnerMost {
    x: Int;
    y: Int;
}

struct InnerMiddle {
    point: InnerMost;
}

struct InnerOuter {
    middle: InnerMiddle;
    z: Int;
}

contract NestedMultiLevel {
    nested: InnerOuter;

    init() {
        self.nested = InnerOuter{
            middle: InnerMiddle{
                point: InnerMost{ x: 1, y: 2 }
            },
            z: 3
        };
    }
}
