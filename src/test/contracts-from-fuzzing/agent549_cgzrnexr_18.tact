struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

struct Figure {
    l1: Line;
    l2: Line;
    hasDiagonal: Bool;
}

contract Shapes {
    fig: Figure;

    init() {
        self.fig = Figure{
            l1: Line{ start: Point{x:0,y:0}, end: Point{x:1,y:1} },
            l2: Line{ start: Point{x:1,y:0}, end: Point{x:0,y:1} },
            hasDiagonal: true,
        };
    }

    receive() {
        self.fig = Figure{
            l1: Line{ start: Point{x:2,y:2}, end: Point{x:3,y:3} },
            l2: Line{ start: Point{x:3,y:2}, end: Point{x:2,y:3} },
            hasDiagonal: false,
        };
    }
}