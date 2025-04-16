struct Point {
    x: Int;
    y: Int;
}

message(0x12345678) Msg {
    p: Point;
}

contract MessageFieldTest {
    m: Msg;

    init() {
        self.m = Msg{ p: Point{ x: 1, y:2 } };
    }
}