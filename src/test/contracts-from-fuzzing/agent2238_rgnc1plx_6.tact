struct Point { x: Int; y: Int }

contract TestContract {
    position: Point = Point{x: 0, y: 0};

    init() {
        self.position = Point{x: 10, y: 20};
    }
}
