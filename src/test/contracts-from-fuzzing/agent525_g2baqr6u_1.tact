struct Point {
    x: Int;
    y: Int;
}

struct Box {
    tl: Point;
    br: Point;
}

contract Test {
    b: Box;

    init() {
        self.b = Box{
            tl: Point{ x: 0, y: 0 },
            br: Point{ x: 10, y: 10 }
        };
    }
}
