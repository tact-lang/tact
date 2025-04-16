struct NestedInner {
    value: Int;
}

struct NestedMiddle {
    nested: NestedInner;
}

struct NestedOuter {
    middle: NestedMiddle;
}

contract Test {
    nested: NestedOuter;

    init() {
        self.nested = NestedOuter{
            middle: NestedMiddle{
                nested: NestedInner{
                    value: 123
                }
            }
        };
    }
}