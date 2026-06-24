/// Snippet 7: Conversion to Cell and back using nested structs
struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

fun main() : Int {
    let l = Line{ start: Point{ x: 10, y: 20 }, end: Point{ x: 30, y: 40 } };
    let cell = l.toCell();
    let parsed: Line = Line.fromCell(cell);
    return parsed.start.x + parsed.start.y + parsed.end.x + parsed.end.y; // Expected 10+20+30+40 = 100
}
