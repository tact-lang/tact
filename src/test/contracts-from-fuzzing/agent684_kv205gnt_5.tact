struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Box {
    min: Point;
    max: Point;
    label: String = "Box";
}

contract TestContract {
    bbox: Box;

    init() {
        self.bbox = Box {
            min: Point { x: 0, y: 0 },
            max: Point { x: 100, y: 100 },
        };
    }

    receive() {
        dump(self.bbox.label);
        dump(self.bbox.min.x);
        dump(self.bbox.max.y);
    }
}
