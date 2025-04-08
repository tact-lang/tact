struct Point {
    x: Int;
    y: Int;
}

struct Container {
    pt1: Point;
    optPt2: Point?;
}

contract NestedOptStruct {
    data: Container;
    init() {
        self.data = Container{
            pt1: Point{x:1,y:2},
            optPt2: null
        };
    }
}