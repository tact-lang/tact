struct Point { x: Int; y: Int }

contract SimpleNested {
    point: Point;
    init() {
        self.point = Point{ x: 1, y: 2 };
    }
}