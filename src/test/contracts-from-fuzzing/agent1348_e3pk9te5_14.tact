struct Point2D {
    x: Int as int64;
    y: Int as int64;
}

struct Box {
    min: Point2D;
    max: Point2D;
}

contract Geometry {
    bbox: Box;

    init() {
        self.bbox = Box{
            min: Point2D{x:0,y:0},
            max: Point2D{x:1000,y:1000}
        };
    }
}