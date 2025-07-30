struct Coord {
    x: Int;
    y: Int;
}

struct Line {
    start: Coord;
    end: Coord;
}

contract TrailingCommaPuns {
    l: Line;

    init() {
        let x = 1;
        let y = 2;
        self.l = Line{
            start: Coord{ x, y },
            end: Coord{ x:3, y:4 },
        };
    }
}
