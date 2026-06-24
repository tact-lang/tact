struct Point { x: Int as int64; y: Int as int64; }

message Move {
    deltaX: Int as int64;
    deltaY: Int as int64;
}

contract Coordinate {
    pos: Point;

    init() {
        self.pos = Point{ x:0, y:0 };
    }
}
