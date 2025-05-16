struct Coord {
    x: Int as int64;
    y: Int as int64;
}

contract TestContract {
    position: Coord;

    init() {
        self.position = Coord{ x: 10, y: 20 };
    }
}