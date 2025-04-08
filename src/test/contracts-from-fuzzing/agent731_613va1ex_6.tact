struct Line {
    startX: Int;
    startY: Int;
    endX: Int;
    endY: Int;
}

contract ManyInts {
    point: Line;

    init() {
        self.point = Line{
            startX: 1,
            startY: 2,
            endX: 3,
            endY: 4
        };
    }
}