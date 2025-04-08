struct NestedInner {
    innerValue: Int;
}

struct NestedOuter {
    outerValue: Int;
    nested: NestedInner;
}

contract DeepNest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            outerValue: 10,
            nested: NestedInner{
                innerValue: 5
            }
        };
    }
}