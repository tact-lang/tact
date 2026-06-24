struct Point {
    x: Int;
    y: Int;
}

struct Container {
    a: Point;
    b: Point?;
    c: Point?;
}

contract OptionalStructs {
    data: Container;

    init() {
        self.data = Container{
            a: Point{ x: 1, y: 2 },
            b: null,
            c: Point{ x: 3, y: 4 },
        };
    }
}