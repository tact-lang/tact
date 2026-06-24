struct Coord {
    x: Int;
    y: Int;
}

contract PointStorage {
    position: Coord;

    init() {
        self.position = Coord{ x: 1, y: 2 };
    }
}
