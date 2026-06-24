struct Point {
    x: Int;
    y: Int;
}

struct Line {
    p1: Point;
    p2: Point;
}

contract Test {
    receive() {
        let l: Line = Line{p1: Point{x:1,y:2}, p2: Point{x:3,y:4}};
    }
}