struct Point { x: Int; y: Int; }

contract OptionalStructField {
    pointOpt: Point? = null;

    init() {
        self.pointOpt = Point { x: 1, y: 2 };
    }
}