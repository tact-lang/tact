struct Point {
    x: Int;
    y: Int;
}

contract PointsOptional {
    pos: Point?;
    init() {
        self.pos = null;
    }
}