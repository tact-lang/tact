struct Point { x: Int; y: Int; }

struct Line { start: Point; end: Point; label: String; }

contract Geometry {
    l: Line;

    init() {
        self.l = Line{
            start: Point{ x:0, y:0 },
            end: Point{ x:10, y:10 },
            label: "A"
        };
    }
}