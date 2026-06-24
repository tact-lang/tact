struct Point {
    x: Int as uint64;
    y: Int as uint64;
}

struct Box {
    lowerLeft: Point;
    upperRight: Point;
}

contract Geometry {
    box: Box;

    init() {
        self.box = Box{
            lowerLeft: Point{
                x: 0,
                y: 0
            },
            upperRight: Point{
                x: 10,
                y: 20
            }
        };
    }
}