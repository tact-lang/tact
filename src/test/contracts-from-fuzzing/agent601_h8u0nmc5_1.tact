struct NestedPoint {
    x: Int;
    y: Int;
}

struct DeepNest {
    p1: NestedPoint;
    p2: NestedPoint;
    p3: NestedPoint;
}

contract DeepNestedContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            p1: NestedPoint{ x: 1, y: 2 },
            p2: NestedPoint{ x: 3, y: 4 },
            p3: NestedPoint{ x: 5, y: 6 },
        };
    }
}
