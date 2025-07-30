struct Point {
    x: Int;
    y: Int;
}

struct WithPoint {
    pt1: Point;
    pt2: Point;
    optPt: Point?;
}

contract ManyNestedStructs {
    data: WithPoint;
    init() {
        self.data = WithPoint{
            pt1: Point{ x:1,y:2 },
            pt2: Point{ x:3,y:4 },
            optPt: null
        };
    }
}