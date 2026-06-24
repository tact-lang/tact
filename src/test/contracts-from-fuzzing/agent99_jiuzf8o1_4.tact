struct Point {
    x: Int;
    y: Int;
}

contract TestStructGetter {
    point: Point;

    init() {
        self.point = Point{
            x: 10,
            y: 20
        };
    }

    receive() {}

    // Getter function returning a composite type (struct)
    get fun getPoint(): Point {
        return self.point;
    }
}
