struct Coord {
    x: Int;
    y: Int;
}

contract SingleStructField {
    pt: Coord;

    init() {
        self.pt = Coord{ x: 10, y: 20 };
    }
}