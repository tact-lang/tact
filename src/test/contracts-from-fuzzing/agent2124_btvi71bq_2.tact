struct Point {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

struct Container {
    p1: Point;
    p2: Point;
    p3: Point;
}

contract NestedStructs {
    nested: Container;

    init() {
        self.nested = Container{
            p1: Point{a:1,b:2,c:3,d:4},
            p2: Point{a:5,b:6,c:7,d:8},
            p3: Point{a:9,b:10,c:11,d:12},
        };
    }
}