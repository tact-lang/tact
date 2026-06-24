struct Line {
    startX: Int;
    startY: Int;
    endX: Int;
    endY: Int;
}

contract Shapes {
    line1: Line;
    line2: Line;
    line3: Line;

    init() {
        self.line1 = Line{ startX:0, startY:0, endX:10, endY:10 };
        self.line2 = Line{ startX:5, startY:5, endX:15, endY:15 };
        self.line3 = Line{ startX:10, startY:10, endX:20, endY:20 };
    }
}