struct Coord {
    x: Int;
    y: Int;
}

contract TestContract {
    pt: Coord;

    init() {
        self.pt = Coord{ x: 10, y: 20 };
    }
}