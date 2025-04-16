struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Circle {
    center: Point;
    radius: Int as uint32;
}

contract Shapes {
    c: Circle;

    init() {
        self.c = Circle{
            center: Point{
                x: 1,
                y: 2
            },
            radius: 5
        };
    }
}