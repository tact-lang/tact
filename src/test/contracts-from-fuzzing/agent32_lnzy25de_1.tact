struct Coord {
    x: Int;
    y: Int;
}

contract TestContract {
    point: Coord;

    init() {
        self.point = Coord{ x: 10, y: 20 };
    }
}