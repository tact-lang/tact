struct Point {
    x: Int as int64;
    y: Int as int64;
    name: String;
    flag: Bool?;
}

struct Line {
    start: Point;
    end: Point;
    label: String;
    optionalFlag: Bool?;
}

contract GeometryTest {
    data: Line;

    init() {
        self.data = Line{
            start: Point{ x: 0, y: 0, name: "Origin", flag: null },
            end: Point{ x: 10, y: 10, name: "EndPoint", flag: true },
            label: "Diagonal1",
            optionalFlag: false
        };
    }

    receive() {
        let sx = self.data.start.x;
        let ey = self.data.end.y;
        let f = self.data.optionalFlag;
    }
}
