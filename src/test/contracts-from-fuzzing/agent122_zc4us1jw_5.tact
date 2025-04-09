struct Point { x: Int; y: Int; label: String; }

contract TestCoord {
    coord: Point;

    init() {
        self.coord = Point{ x: 5, y: 10, label: "start" };
    }
}
