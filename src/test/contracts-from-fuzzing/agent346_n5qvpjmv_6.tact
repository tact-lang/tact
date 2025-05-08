struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Box {
    corner1: Point;
    corner2: Point;
    optionalInfo: Int?;
}

contract NestedSerialization {
    data: Box;

    init() {
        self.data = Box{
            corner1: Point{ x: 1, y: 1 },
            corner2: Point{ x: 5, y: 5 },
            optionalInfo: null
        };
    }
}