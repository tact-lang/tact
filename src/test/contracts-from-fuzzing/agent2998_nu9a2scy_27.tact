struct Point {
    x: Int;
    y: Int;
}

struct Box {
    bottomLeft: Point;
    topRight: Point;
}

contract BoxContract {
    bbox: Box;
    init() {
        self.bbox = Box{
            bottomLeft: Point{ x:0, y:0 },
            topRight: Point{ x:10, y:10 },
        };
    }
}