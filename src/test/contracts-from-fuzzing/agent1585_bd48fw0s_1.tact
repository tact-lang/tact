struct NestedPoint {
    x: Int;
    y: Int;
}

struct DeepNested {
    point1: NestedPoint;
    point2: NestedPoint;
}

contract DeepNestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            point1: NestedPoint{ x: 1, y: 2 },
            point2: NestedPoint{ x: 3, y: 4 }
        };
    }
}