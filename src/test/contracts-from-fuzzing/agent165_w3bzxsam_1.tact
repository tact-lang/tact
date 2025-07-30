struct Point { x: Int; y: Int }

contract TestContract {
    coord: Point;

    init() {
        self.coord = Point{ x: 10, y: 20 };
    }
}