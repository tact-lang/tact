struct Point {
    x: Int;
    y: Int;
}

contract HasStructField {
    point: Point;

    init() {
        self.point = Point{ x:1, y:2 };
    }
}
