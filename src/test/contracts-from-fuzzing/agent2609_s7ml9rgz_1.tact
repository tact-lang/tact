struct Coord {
    x: Int;
    y: Int;
}

contract TestContract {
    point: Coord;

    init() {
        self.point = Coord{ x: 3, y: 4 };
    }
}