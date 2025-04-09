struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Line {
    start: Point;
    end: Point;
    label: String?;
}

contract TestContract {
    geometry: Line;
    
    init() {
        self.geometry = Line{
            start: Point{ x: 1, y: 2 },
            end: Point{ x: 3, y: 4 },
            label: null,
        };
    }
}