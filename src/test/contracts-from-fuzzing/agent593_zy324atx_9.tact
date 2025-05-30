struct Point { x: Int; y: Int; }

struct Line { start: Point; end: Point; }

struct Segment {
    first: Line;
    second: Line;
}

contract NestedSegments {
    seg: Segment = Segment{
        first: Line{
            start: Point{ x: 1, y: 2 },
            end: Point{ x: 3, y: 4 },
        },
        second: Line{
            start: Point{ x: 5, y: 6 },
            end: Point{ x: 7, y: 8 },
        },
    };

    init() {}
}