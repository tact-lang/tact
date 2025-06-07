struct Point {
    x: Int;
    y: Int;
    label: String;
}

struct Meta {
    point: Point;
    timestamp: Int;
    active: Bool;
}

contract TestContract {
    meta: Meta;
    init() {
        self.meta = Meta{
            point: Point{ x: 100, y: 200, label: "origin" },
            timestamp: 1234567890,
            active: true,
        };
    }
}