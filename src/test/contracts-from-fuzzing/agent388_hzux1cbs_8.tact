struct Point {
    x: Int;
    y: Int;
}

struct Contour {
    p1: Point;
    p2: Point;
}

contract DeepFields {
    contour: Contour;

    init() {
        self.contour = Contour{
            p1: Point{ x: 1, y: 2 },
            p2: Point{ x: 3, y: 4 }
        };
    }
}