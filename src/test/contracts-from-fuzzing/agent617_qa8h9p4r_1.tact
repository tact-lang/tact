struct Coord {
    x: Int;
    y: Int;
}

contract Test {
    point: Coord;
    init() {
        self.point = Coord{ x: 1, y: 2 };
    }
}