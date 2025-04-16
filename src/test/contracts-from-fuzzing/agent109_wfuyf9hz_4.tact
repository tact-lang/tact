struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Contains {
    pointA: Point;
    pointB: Point;
    pointC: Point;
}

contract Test {
    points: Contains;

    init() {
        self.points = Contains{
            pointA: Point{x:1,y:2},
            pointB: Point{x:3,y:4},
            pointC: Point{x:5,y:6}
        };
    }
}
