struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Circle {
    center: Point;
    radius: Int as uint32;
    label: String?;
}

contract TestContract {
    shape: Circle;

    init() {
        self.shape = Circle {
            center: Point { x: 0, y: 0 },
            radius: 42,
            label: null
        };
    }
}