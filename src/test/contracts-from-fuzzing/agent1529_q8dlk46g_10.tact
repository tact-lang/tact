struct Point { x: Int; y: Int; }

struct PolyLine {
    start: Point;
    end: Point;
    label: String;
}

contract Shape {
    line: PolyLine;

    init() {
        self.line = PolyLine{
            start: Point{ x:0, y:0 },
            end: Point{ x:10, y:10 },
            label: "AB"
        };
    }
}
