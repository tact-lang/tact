struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

struct Shape {
    first: Line;
    second: Line;
}

contract ManyNestedStructs {
    shape: Shape;

    init() {
        self.shape = Shape{
            first: Line{start: Point{x:1,y:2}, end: Point{x:3,y:4}},
            second: Line{start: Point{x:5,y:6}, end: Point{x:7,y:8}}
        };
    }
}