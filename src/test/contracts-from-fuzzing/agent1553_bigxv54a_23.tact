struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct WithPoint {
    pt: Point;
}

contract PointTest {
    coord: WithPoint;

    init() {
        self.coord = WithPoint{pt: Point{x:1,y:2}};
    }
}