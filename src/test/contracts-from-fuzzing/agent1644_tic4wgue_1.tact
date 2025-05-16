struct Coord {
    lat: Int;
    long: Int;
}

contract TestContract {
    pos: Coord;

    init() {
        self.pos = Coord{ lat: 0, long: 0 };
    }
}