struct Point {
    x: Int;
    y: Int;
}

struct WithArray {
    p1: Point;
    p2: Point;
    p3: Point;
}

contract MultiNested {
    data: WithArray;

    init() {
        self.data = WithArray{
            p1: Point{x:1,y:2},
            p2: Point{x:3,y:4},
            p3: Point{x:5,y:6}
        };
    }
}