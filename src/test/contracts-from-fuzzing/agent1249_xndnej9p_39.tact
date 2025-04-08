struct Point {
    x: Int as int32;
    y: Int as int32;
}

contract SerializeEdge {
    data: Point;

    init() {
        self.data = Point{x:-100,y:100};
    }
}