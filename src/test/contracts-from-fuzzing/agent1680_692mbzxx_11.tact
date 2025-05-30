struct Coord {
    x: Int = 0;
    y: Int = 0;
}

struct Shape {
    start: Coord;
    end: Coord;
    middle: Coord;
}

contract RepeatStruct {
    geom: Shape = Shape{
        start: Coord{ x:1, y:2 },
        end: Coord{ x:3, y:4 },
        middle: Coord{ x:5, y:6 }
    };
    receive() {}
}