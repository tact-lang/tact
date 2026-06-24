struct Coord {
    x: Int;
    y: Int;
}

contract TestContract {
    location: Coord;

    init() {
        self.location = Coord{ x: 1, y: 2 };
    }
}