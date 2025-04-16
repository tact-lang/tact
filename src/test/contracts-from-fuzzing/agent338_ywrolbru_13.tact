struct Point {
    x: Int as int64;
    y: Int as int64;
}

contract Coord {
    pt: Point;

    init() {
        self.pt = Point{x: 1, y: -1};
    }
}