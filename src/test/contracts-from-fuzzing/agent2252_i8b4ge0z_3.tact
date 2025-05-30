struct Point { x: Int; y: Int }

struct DeepNest {
    p1: Point;
    p2: Point;
    nested: Point;
}

contract DeepNestedStorage {
    deep: DeepNest;
    init() {
        self.deep = DeepNest{
            p1: Point{ x: 1, y: 2 },
            p2: Point{ x: 3, y: 4 },
            nested: Point{ x: 5, y: 6 },
        };
    }
}