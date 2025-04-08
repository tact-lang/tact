struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

struct Polygon {
    p1: Point;
    p2: Point;
    p3: Point;
}

contract MultiStruct {
    l: Line;
    poly: Polygon;

    init() {
        self.l = Line{start: Point{x: 1, y: 2}, end: Point{x: 3, y: 4}};
        self.poly = Polygon{p1: Point{x: 5, y: 6}, p2: Point{x: 7, y: 8}, p3: Point{x: 9, y: 10}};
    }
}
