struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

struct Triangle {
    a: Point;
    b: Point;
    c: Point;
}

struct Geometry {
    line: Line;
    triangle: Triangle;
}

contract GeometryStorage {
    data: Geometry;

    init() {
        self.data = Geometry{
            line: Line{
                start: Point{x: 1, y: 2},
                end: Point{x: 3, y: 4}
            },
            triangle: Triangle{
                a: Point{x: 5, y: 6},
                b: Point{x: 7, y: 8},
                c: Point{x: 9, y: 10}
            }
        };
    }
}