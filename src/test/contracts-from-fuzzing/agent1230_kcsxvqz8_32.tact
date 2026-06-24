struct Point {
    x: Int;
    y: Int;
}

message Dummy {}

contract StructAndMsg {
    p: Point;

    init() {
        self.p = Point{ x:1, y: 2 };
    }

    receive(msg: Dummy) {
        self.p = Point{ x:42, y:37 };
    }
}