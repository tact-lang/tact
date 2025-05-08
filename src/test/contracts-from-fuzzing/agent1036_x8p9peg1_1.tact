struct DeepNested {
    point: Point;
    opt: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    field: DeepNested;
    init() {
        self.field = DeepNested{
            point: Point{ x: 1, y: 2 },
            opt: Inner{ value: 10, flag: true }
        };
    }
}