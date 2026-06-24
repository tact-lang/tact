struct Coord {
    x: Int;
    y: Int;
}

contract TestContract {
    position: Coord;

    init() {
        self.position = Coord{x: 0, y: 0};
    }
}