struct Point {
    x: Int;
    y: Int;
}

struct Container {
    a: Int;
    b: Point;
}

contract MultiTypeNested {
    field: Container;

    init() {
        self.field = Container{ a: 7, b: Point{ x:1,y:2 } };
    }
}